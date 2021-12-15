import re
from ethiopian_date import EthiopianDateConverter
from openpyxl import load_workbook
import datetime
import sys


def splitdate(datetm):
	# isdatetime = (type(datetm)!= type('str'))
	if type(datetm)!= type('str'): 
		date = datetm.strftime("%d-%m-%Y")
	else:
		date = datetm
	sp = re.split(r'/|-',date)

	d = int(sp[0])
	m = int(sp[1])
	y = int(sp[2])
	if len(sp[2])==2:
		y = int("20"+sp[2])
	return [y,m,d]

def nameappend(x,a='_greg'):
		y = x.split('.')[0]
		n = y+ a +".xlsx"
		return n


def covert2greg(etdate):
	etdated = splitdate(etdate)
	conv = EthiopianDateConverter.to_gregorian
	grdate = conv(etdated[0],etdated[1],etdated[2])
	grdated = grdate.strftime("%d/%m/%Y")
	return grdated

# etdate = "4-4-2014"
# grdate1 = conv(2014,4,4)
# print (grdate, type(grdate), grdated) 

if __name__ == '__main__':

	""" The command line arguments are row range example: $ python dateconv.py 2-324 
	    which is 2 inclusive 324 exclusive. [2,324)
	"""
	do = []
	argnum = len(sys.argv)
	for i in range(1,argnum):
		range_str = re.split(r'-',sys.argv[i])
		range_int = [int(range_str[0]),int(range_str[1])]
		do.insert(len(do),range_int) 
	print(sys.argv,do,len(do))
	filename = "sampleBook1.xlsx"
	workbook = load_workbook(filename=filename,data_only=True)
	sheet = workbook.active
	for j in range(len(do)):
		for i in range(do[j][0],do[j][1]):
			cell = sheet["K"+str(i)]
			if cell.value is None:
				continue
			print(type(cell.value),cell.value , splitdate(cell.value), covert2greg(cell.value))
			cell.value = covert2greg(cell.value)
	workbook.save(filename=nameappend(filename))