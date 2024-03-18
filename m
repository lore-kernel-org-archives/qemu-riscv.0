Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39726C54E5D
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 17:46:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rmH3q-0005EE-0O; Mon, 18 Mar 2024 13:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bfreiber@student.ubc.ca>)
 id 1rmFzM-0001id-KZ
 for qemu-riscv@nongnu.org; Mon, 18 Mar 2024 12:37:28 -0400
Received: from esvaout7.mail-relay.ubc.ca ([142.103.117.137]
 helo=nesvaprod07.mail-relay.ubc.ca)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bfreiber@student.ubc.ca>)
 id 1rmFzD-0000Df-Iv
 for qemu-riscv@nongnu.org; Mon, 18 Mar 2024 12:37:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ubc.ca; i=@ubc.ca; q=dns/txt; s=s1; t=1710779840;
 x=1742315840; h=from:to:subject:date:message-id:mime-version;
 bh=v999oEE64Q6p0WmRTlNf0SOV5pfrgTUnNfzLAy1SU3E=;
 b=OoqDXggP0zj2lI6aSitlloflWB92p/DRPKXHUw4+D0utM0sjJOZH7a7f
 Ot4NufnphoA/cTcyJvw0Jz7TO0B52QSZvdTDJnguNQ/Qffbm7d8un8I7f
 lKREsgtksBVYjUN4//Qsgy1roFq0RwRgAPSF/5h7Xzu2YgcbwAoorDXT8
 sH5xd4KtnNOfkIS/w9IRtyHk2c3BAL5mR6HFNdlz3j03PxeoGz95ZkpeG
 3jwKQOnLGha+xYSBK1nQmVcZvWJcRw+De9A0XhV0lG0PxKSKGho2Fcuns
 tvON0seJeCn3mLb7gHQKAF7/7/Yc2XUi1FgLsmmANqfstjhu2EiAGrOU6 w==;
X-CSE-ConnectionGUID: bdo570WcTFORvA9lSmy1Tw==
X-CSE-MsgGUID: EkuzVquDTZGBlTZGe7RJ1A==
X-ExtLoop1: 1
X-SMTPAUTH: FALSE
IronPort-Data: A9a23:pO8m/an8dGZor+Ui8V9OLljo5gwuJERdPkR7XQ2eYbSJt1+Wr1Gzt
 xIv7RMyw0vx1phBB6l0bb0CeDoHuZblerYTSQdyrTc1CSsS9aIpPPzBRm/oJSSeM8bfe0xu6
 sQae7HoIds9JpPmjk7F3oPJ8z8kislkepKmULSYYnsoFVc9IMscoUkLd9AR09YAbeeRXlvlV
 ePa+6X3JFKj0jhoBWMYg4rrRMRH5auaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DFrrx8Q4ZWc
 QpjIIaRpQs19z91Yj+sfy2SnkciGtY+NiDX4pZatjPLbrGvaUXe345iXMfwZ3u7hB2Dk9csl
 41yvqCebj03F/zIo+EMCiVHRnQW0a1uoNcrIFCktNCLiUjPcn+q3v9lSko/VWEa0r8vRz0Ts
 6ZEbmFSBvyAr7veLLaTQOd2i8UpIdPDJ58Ctnxm0XfEB/1gSpmrr6Diu4QEhmZu2ZAm8fD2S
 skEewR2cTj8UTJlPmslJ59hpsXxryyqG9FfgBfPzUYt2EDKwQlslaLsK9HLUtqNQ8pTgwCfv
 G2uwojiKhUQLNObxyGOqiujnfPXxXq+VYQOD+Xhs/A3xUOJyGMXFRBTW1+8qOX/kV+lR99aM
 AoV5mwzp6N0/0XDosTBYiBUaUWs5nY0M+e82cVggO1R4sI4OzqkO1U=
IronPort-HdrOrdr: A9a23:KFHc96gZcRL+4BuVm/6a6IDJq3BQXsQji2hC6mlwRA09TyX4rb
 HMoB1173PJYVoqN03I+urhBEDjex7hHPdOiOF7V4tKNDOW2ldAR7sN0WKN+Vzd82aXzJ856Z
 td
X-Talos-CUID: 9a23:fzGETm9Du8yH+6ngLpuVv0QYHZ16KkLW8Fn3GVGRWGJSTazMdUDFrQ==
X-Talos-MUID: 9a23:koSRUwieyccXjov2yd2Pc8MpGcR18Zq3FWwxo7osv/W2GiEvARXEpWHi
Received: from lbpglfsc01gstp01-ents01-f5-vrfglue-float.systems.it.ubc.ca
 (HELO smtp.mail.ubc.ca) ([10.45.24.97])
 by nesvaprod07.mail-relay.ubc.ca with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Mar 2024 09:37:15 -0700
Received: from SAM-SRV02AP.ead.ubc.ca (10.19.216.62) by
 EXCH-SRV01BP.ead.ubc.ca (10.19.216.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 09:37:15 -0700
Received: from SAM-SRV03AP.ead.ubc.ca (10.19.216.63) by SAM-SRV02AP.ead.ubc.ca
 (10.19.216.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 18 Mar
 2024 09:37:10 -0700
Received: from SAM-SRV03AP.ead.ubc.ca ([fe80::882:9760:e144:6bab]) by
 SAM-SRV03AP.ead.ubc.ca ([fe80::882:9760:e144:6bab%4]) with mapi id
 15.01.2507.035; Mon, 18 Mar 2024 09:37:14 -0700
From: "bfreiber@student.ubc.ca" <bfreiber@student.ubc.ca>
To: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Subject: Opening file: qemu-riscv32
Thread-Topic: Opening file: qemu-riscv32
Thread-Index: AQHaeVFULv0uaRtEk0S4nKbJpjXFmA==
Date: Mon, 18 Mar 2024 16:37:14 +0000
Message-ID: <aaa7424af22a483fa8a1c713acf7c6fc@student.ubc.ca>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [24.207.73.1]
Content-Type: multipart/alternative;
 boundary="_000_aaa7424af22a483fa8a1c713acf7c6fcstudentubcca_"
MIME-Version: 1.0
Received-SPF: pass client-ip=142.103.117.137;
 envelope-from=bfreiber@student.ubc.ca; helo=nesvaprod07.mail-relay.ubc.ca
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 18 Mar 2024 13:45:55 -0400
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--_000_aaa7424af22a483fa8a1c713acf7c6fcstudentubcca_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

Sorry if this is the wrong place to ask this - happy to be redirected if th=
at's the case!


I'm trying to open a file with fopen using qemu-riscv32, but I get an error=
 (38 - function not implemented). The file exists on my host machine, and I=
'm providing the absolute path to the file.

My invocation for qemu is `qemu-riscv32 ./out`.

I am very new to qemu, and built qemu with default configurations. qemu-ris=
cv32 seemed to work otherwise which is why I was using it - I just need the=
 barebones support for now, but will happily use qemu-system-riscv32 if it =
will work.


Any suggestions on what to do / pointers on where to look are very apprecia=
ted!


Cheers,


Brandon

--_000_aaa7424af22a483fa8a1c713acf7c6fcstudentubcca_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p>Hello,<br>
<br>
Sorry if this is the wrong place to ask this - happy to be redirected if th=
at's the case!<br>
</p>
<p><br>
</p>
<p>I'm trying to open a file with fopen using qemu-riscv32, but I get an er=
ror (38 - function not implemented). The file exists on my host machine, an=
d I'm providing the absolute path to the file.
<br>
<br>
My invocation for qemu is `qemu-riscv32 ./out`. <br>
<br>
I am very new to qemu, and built qemu with default configurations. qemu-ris=
cv32 seemed to work otherwise which is why I was using it - I just need the=
 barebones support for now, but will happily use qemu-system-riscv32 if it =
will work.
<br>
</p>
<p><br>
</p>
<p>Any suggestions on what to do / pointers on where to look are very appre=
ciated!</p>
<p><br>
</p>
<p>Cheers,</p>
<p><br>
</p>
<p>Brandon<br>
</p>
</div>
</body>
</html>

--_000_aaa7424af22a483fa8a1c713acf7c6fcstudentubcca_--

