﻿'###############################################################################
'#  UpDown.bi                                                                  #
'#  This file is part of MyFBFramework                                         #
'#  Authors: Nastase Eodor, Xusinboy Bekchanov, Liu XiaLin                     #
'#  Based on:                                                                  #
'#   TUpDown.bi                                                                #
'#   FreeBasic Windows GUI ToolKit                                             #
'#   Copyright (c) 2007-2008 Nastase Eodor                                     #
'#   Version 1.0.0                                                             #
'#  Updated and added cross-platform                                           #
'#  by Xusinboy Bekchanov(2018-2019)  Liu XiaLin                               #
'###############################################################################

#include once "Control.bi"
'Const UDN_DELTAPOS = (UDN_FIRST - 1)

Namespace My.Sys.Forms
	#define QUpDown(__Ptr__) (*Cast(UpDown Ptr,__Ptr__))
	
	Private Enum UpDownOrientation
		udVertical,udHorizontal
	End Enum
	
	Private Enum UpDownAlignment
		udRight,udLeft
	End Enum
	
	'An up-down control is a pair of arrow buttons that the user can click to increment or decrement a value, such as a scroll position or a number displayed in a companion control (called a buddy window).
	Private Type UpDown Extends Control
	Private:
	Protected:
		FPosition     As Integer
		FMinValue     As Integer
		FMaxValue     As Integer
		FStyle        As UpDownOrientation
		FArrowKeys    As Boolean
		FIncrement    As Integer
		FAlignment    As Integer
		FThousands    As Boolean
		FWrap         As Boolean
		#ifndef __USE_GTK__
			FUDAccel(1)   As UDACCEL
		#endif
		AStyle(2)     As Integer
		AAlignment(2) As Integer
		AWrap(2)      As Integer
		AArrowKeys(2) As Integer
		AAThousand(2) As Integer
		FAssociate    As Control Ptr
		#ifndef __USE_GTK__
			Declare Static Sub WndProc(ByRef Message As Message)
			Declare Static Sub HandleIsAllocated(ByRef Sender As Control)
		#endif
		Declare Sub SetRange(AMin As Integer, AMax As Integer)
	Public:
		#ifndef ReadProperty_Off
			Declare Function ReadProperty(ByRef PropertyName As String) As Any Ptr
		#endif
		#ifndef WriteProperty_Off
			Declare Function WriteProperty(ByRef PropertyName As String, Value As Any Ptr) As Boolean
		#endif
		Declare Virtual Sub ProcessMessage(ByRef Message As Message)
		Declare Property Alignment As UpDownAlignment
		Declare Property Alignment(Value As UpDownAlignment)
		Declare Property ArrowKeys As Boolean
		Declare Property ArrowKeys(Value As Boolean)
		Declare Property MinValue As Integer
		Declare Property MinValue(Value As Integer)
		Declare Property MaxValue As Integer
		Declare Property MaxValue(Value As Integer)
		Declare Property Increment As Integer
		Declare Property Increment(Value As Integer)
		Declare Property Position  As Integer
		Declare Property Position(Value As Integer)
		Declare Property TabIndex As Integer
		Declare Property TabIndex(Value As Integer)
		Declare Property TabStop As Boolean
		Declare Property TabStop(Value As Boolean)
		Declare Property Text ByRef As WString
		Declare Property Text(ByRef Value As WString)
		Declare Property Thousands As Boolean
		Declare Property Thousands(Value As Boolean)
		Declare Property Wrap As Boolean
		Declare Property Wrap(Value As Boolean)
		Declare Property Style As UpDownOrientation
		Declare Property Style(Value As UpDownOrientation)
		Declare Property Associate As Control Ptr
		Declare Property Associate(Value As Control Ptr)
		Declare Operator Cast As Control Ptr
		Declare Constructor
		Declare Destructor
		OnChanging   As Sub(ByRef Designer As My.Sys.Object, ByRef Sender As UpDown,Value As Integer,Direction As Integer)
	End Type
End Namespace

#ifndef __USE_MAKE__
	#include once "UpDown.bas"
#endif
