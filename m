Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBt5g-0000D0-Ke
	for mharc-qemu-riscv@gnu.org; Fri, 06 Aug 2021 02:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mBt5e-0000CO-9g; Fri, 06 Aug 2021 02:12:18 -0400
Received: from atcsqr.andestech.com ([60.248.187.195]:41496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mBt5c-0005qx-C0; Fri, 06 Aug 2021 02:12:18 -0400
Received: from mail.andestech.com (atcpcs12.andestech.com [10.0.1.220])
 by ATCSQR.andestech.com with ESMTP id 1766C30u088887;
 Fri, 6 Aug 2021 14:12:03 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from ATCPCS31.andestech.com (10.0.1.89) by ATCPCS12.andestech.com
 (10.0.1.220) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 6 Aug 2021
 14:12:05 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (104.47.125.59)
 by mail.andestech.com (10.0.1.89) with Microsoft SMTP Server (TLS) id
 14.3.498.0; Fri, 6 Aug 2021 14:12:03 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GIXj8ZJ2XEj4Xd/9OvMscllOA7UzT43Pfu+Atlo+Zljdbh7uQ0/8nyhgrN8mPNHh59S5qb/c1XpRM0X96btJLu5tIjmmvsdEgJuemUjm7wTC9X4u0Zh+8gU27QMY7R94IneTGrn57WXH+q3ViZUVh/3aGM3XptSUhCKZXdWG9M5IAInQpFIK0ayOZMKjwMg/BbqXJWgVErhVlfIv5hFr7q4cYsb447lk/ZXUT+avPZ5ULYBSCKjX/S/xntgjW0rTL6XQ+k0gdXto3V9+KyIpQ1CnSuOsdFCXG27Kuja9nHOWY/7wYd+kIDcGbtbkRVlqKOfOyZg1fwLp35MTixzAWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZ6ra1H2Dl9AG1pt788P2kxY+WelyWNwsMoWAe/Wbvg=;
 b=ex4Wz/m+QozIwyD+lweSzlPxb4+iXe9jI7rczC62+QCBkYudzuyctMB4atHj0h1unKc/d/3308q7pbYlx7tqvdGj+J3fco8d2nQaJHoBC+5KQLq4QnsLsj7bNjpoOB69Rq9s68UAsldjXd3Padi5N3ILoE9CeCfxKDMqheUQVC9zeRF2EppewOkQqkza1vA0XIsZGTtkFp4YASI6jEzXT85yKwCRPRxwnbYbjwzchOP8wOcEGeaPCpRDMX222HpKc0iihREfVj4z3xD2o7WAU93QQovhD2ux/W36njKQlxlsOHLxtGGdIbUnY0aqFPzfGeYQ6Uny7+d8OFHeT6RS3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=andestech.com; dmarc=pass action=none
 header.from=andestech.com; dkim=pass header.d=andestech.com; arc=none
Received: from SG2PR03MB4263.apcprd03.prod.outlook.com (2603:1096:4:81::17) by
 SG2PR03MB2782.apcprd03.prod.outlook.com (2603:1096:3:23::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.11; Fri, 6 Aug 2021 06:12:00 +0000
Received: from SG2PR03MB4263.apcprd03.prod.outlook.com
 ([fe80::f08e:fed9:1286:9f03]) by SG2PR03MB4263.apcprd03.prod.outlook.com
 ([fe80::f08e:fed9:1286:9f03%6]) with mapi id 15.20.4394.015; Fri, 6 Aug 2021
 06:12:00 +0000
From: =?iso-2022-jp?B?UnVpbmxhbmQgQ2h1YW4tVHp1IFRzYSgbJEJocVEjO3EbKEIp?=
 <ruinland@andestech.com>
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>
CC: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, "open
 list:RISC-V" <qemu-riscv@nongnu.org>, wangjunqiang
 <wangjunqiang@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>,
 =?iso-2022-jp?B?RHlsYW4gRGFpLVJvbmcgSmhvbmcoGyRCPmFCUk07GyhCKQ==?=
 <dylan@andestech.com>
Subject: Re: [RFC PATCH v4 3/4] Adding Andes AX25 and A25 CPU model
Thread-Topic: [RFC PATCH v4 3/4] Adding Andes AX25 and A25 CPU model
Thread-Index: AQHXiiNCkVq8Z+6ZnEKBSqY0hBgNmqtl1UYAgAApYTI=
Date: Fri, 6 Aug 2021 06:11:59 +0000
Message-ID: <SG2PR03MB4263ED48818608B30AE3C801D5F39@SG2PR03MB4263.apcprd03.prod.outlook.com>
References: <20210805175626.11573-1-ruinland@andestech.com>
 <20210805175626.11573-4-ruinland@andestech.com>,
 <CAEUhbmU=PN0K+jQzYsbw+0WK6C6w85t2tNGhW0uHJMgfeKvCfw@mail.gmail.com>
In-Reply-To: <CAEUhbmU=PN0K+jQzYsbw+0WK6C6w85t2tNGhW0uHJMgfeKvCfw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=andestech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f3f6a8d-7919-4fc4-7700-08d958a11a25
x-ms-traffictypediagnostic: SG2PR03MB2782:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SG2PR03MB2782230F354C4FCE86825766D5F39@SG2PR03MB2782.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wvONvFsaulOLcYf6oRT0uuUi8s1IPrKOKw5HaifqskibsDgRG6FwBYOsSpEcTSzbDRDCGQK63zdLDEgblC+iO2sLnzgpta03j3XgyMtQGQbzJZMqIVPVudm0DbrEZy6VuClWYRtIJEaoC38bk0wtdsBM/byqNEg7lg6nYgDu3PAQN+eNw6HbVXuf0KlSsYcalugHcmZsR5S2ZiMwNugpmVtne+5zC4EdhUfAAr82oLiZ+I46b+4t7JX21DI1fLh8bijb/cn0mjagNDhyXXf86AHAtZ2ecI6ToQ4xmevBICoDo3l/KzdGOLxhcz0TTpJKmbFO/pvCaSp+e8jY5X0uUoZ8+Xbtq3KfJkEYPa9ljaJT9BsdMaiF4IwFHd2Cf7+ypPBt4GzjY1Q+BtXEpMtqy+ZIbtrbqZyFog3s+vYWJ38aKIrecn+5HRL985QzztGdUtufSXyPg7Z5RXpIttRaleEBlY+o2rOTYoGQZ/o84EXIMDhSw6iTDVVrpJx0bLMPLPos9lEEbLmZ0HxfQmyTQGFll7idRBGpaZzd2PJgJ3ulQ6dAjEVPowtZPSfQvxjqrvFKjTCH1j2Q5oCvCUmyLroLd2fSyT+Ocn+1chzmJndBpZv+8qaDsND4o/SQFXhe54i083lAciZ6khPSYRNuGCiKiJBs3LhD+P5ahD10xayYH0sTRmglHfCOfLytxA+zwXahMsK6iPc86J/U+XUWOA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR03MB4263.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39830400003)(346002)(396003)(376002)(85182001)(8676002)(19627405001)(26005)(86362001)(7696005)(55016002)(66476007)(122000001)(4326008)(9686003)(83380400001)(6506007)(66446008)(64756008)(110136005)(8936002)(54906003)(2906002)(38070700005)(186003)(107886003)(66946007)(478600001)(316002)(33656002)(71200400001)(91956017)(76116006)(38100700002)(52536014)(66556008)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?V3hxWTdzRWQ2NkdqQ2tUdFQycitER2hNRnlmbHFveUlJMTQwVm1CRWVL?=
 =?iso-2022-jp?B?NE1GRUxWdWF1dEg4bE5ubjhZSXJFS3doUVlHNi95bEZkOGVXK2tkTmww?=
 =?iso-2022-jp?B?cVMxTzZiSVZLNlc3eUpvTy9BL0d5a0owODVsVmVvc2pIZjZsODVRdDg2?=
 =?iso-2022-jp?B?cXg0OTBIci9GaVRmVWpRcW5KaHdtdjZHYzMyKzFwRWREWUlaSnBtNFQr?=
 =?iso-2022-jp?B?T2toZE5NeVZHek5lSmRWdm9tK0NWb0RrT1h4TFBSWi9rVDArL0lBdWw4?=
 =?iso-2022-jp?B?VFBEcW9GYVJMMEJjUzNvVGdRdkprNGFFRUU3ZzZLcW55dGV5dlJiR3hI?=
 =?iso-2022-jp?B?OXI4ZXZwbDE3akxIeDhrOS83RXdsSDNpM0R4ODJnUVlJcXlhc3ZoYTdV?=
 =?iso-2022-jp?B?NFRsRWdHU0dCU0R1KzVLY3lPdVNsZzF2U2dTU2ljaHl4NS9OSS9vNXhY?=
 =?iso-2022-jp?B?TjY5dFNjTnorVFdaMDZCeHkxQmJJbG9WcWtLL2RrTFZwclJabG1MNkhY?=
 =?iso-2022-jp?B?Nnl3Sng5YlhyY0Urd3NKSmFxRmxRQ2s5ZU5QQlJsWGFxb0tKLzNSLzI2?=
 =?iso-2022-jp?B?YlFTaTAxdkQrL2FUNUtPVEo4Q05RVmJIUnRhbzVKbEJZNEJkSW1UVkZT?=
 =?iso-2022-jp?B?cW9scTM0MHpSamNIWTk3RW41SFJZWWFrYmVkakg3S0JQZnpVMWE4QlBD?=
 =?iso-2022-jp?B?Y3VCK2gvUXAzVnAxY0RlekN5T3ZINnJYTkdOK3FVWmJuSEh2YnVqVEJE?=
 =?iso-2022-jp?B?Sm9OMW5NdFh6djBLYkNuRjA0NTQ1akVPdVFhazFnVUM2WlRqZ2dmUTNQ?=
 =?iso-2022-jp?B?a0JXZnZJU0VQYWcrWDI0dGh5aUc0NXFvTUxpU005VUFPZ2xHMXZrb096?=
 =?iso-2022-jp?B?WWhGVnJESWRCVWNTV280dnhLMkJhMEZhUmM1RWthMW5rRW9JODdCOFcy?=
 =?iso-2022-jp?B?dlozTTN2MVU5VVoyMksxRkZ6S2pmQWVOYW1RUTFCZjRKckNmS1h5Mi9T?=
 =?iso-2022-jp?B?c1lYRDdFNmdsLzc3QkJiaGpINGJ4M0tQc0pkREY0Rm9tRlNsL1BZVXI4?=
 =?iso-2022-jp?B?OGlFeGdtb1U5VnBYR0NoTDA2R243RFFqQ3dmZjhxZzE1dUpDOVlRd3lv?=
 =?iso-2022-jp?B?NC8zUHY5bzZpai9lVWpqTG80QWFzcGhPRWJ0OEpOWUlOa0ZKSjduU3o2?=
 =?iso-2022-jp?B?NmZGdEIwYnZZUGZUc0RnZGpaV3F0ODd1dlJUQzFRR25RWlh1RzlENjVj?=
 =?iso-2022-jp?B?cXV2VzYyODBxTVpXNkEzVEdQMWljVTlWM3pQcURyUDVwTGtLVG4zeHZL?=
 =?iso-2022-jp?B?TnhCOVZmL1puL1dxSm1QeHRNNXE4Q0hOTnZJaVJNTVRIcHkvWTNOcjBt?=
 =?iso-2022-jp?B?UXVISmNwTlFRSWsrbll0dzV6dnNjVGF2ZnBYMnBSOUI2eVJrQlZ2b081?=
 =?iso-2022-jp?B?dW9yOTBmcFVFeDEwTUxpa0JYQU4yaFRtRkVhSGRhYUhYc29UWmg0NWJT?=
 =?iso-2022-jp?B?amZvaUR3NVpaMUFtdkRMU0gzUEQ0a0N6N2liU0dGMXhyckROWG1jL1lN?=
 =?iso-2022-jp?B?MHArNFlzbzl5T2c4ZUkvbG5SNVJVSmRlanROZERUeVgyb0l3Qncxakt5?=
 =?iso-2022-jp?B?WnI1ODIxZzBvbThqeWlvemNjaFgrZ2U1YTRVZXVaV3VvRWtsU0hMRVB0?=
 =?iso-2022-jp?B?bDlnVi85NC80VmUza011L2JMc3IrV0tkOW44ZGR6dzh0Q0pzZE9ZSTVN?=
 =?iso-2022-jp?B?cGNCVmRwdWV1cm5WdWd3ZkpXTHJ2Q3lDQllpZ0ZpanRZNUJXVHNVcnl2?=
 =?iso-2022-jp?B?TjFMSEorVFk1TzZBblpodEk3bDNnanl4UTk5Z2N3c2ZIZmlGNEdSaVhs?=
 =?iso-2022-jp?B?WjJXRlRTL2tlbUY5akJLSUF6MHRRPQ==?=
Content-Type: multipart/alternative;
 boundary="_000_SG2PR03MB4263ED48818608B30AE3C801D5F39SG2PR03MB4263apcp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB4263.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f3f6a8d-7919-4fc4-7700-08d958a11a25
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2021 06:11:59.9658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e3ec21b7-ec6c-4041-9add-61aea8171458
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yB5tYgLPb3dNIgIeOk54YXRIEWLqWdurQmIkA3Blf/eZgcAB6D7jYGxmLKweiOGO37UFgrL5OHqj+J4YMbOR2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB2782
X-OriginatorOrg: andestech.com
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 1766C30u088887
Received-SPF: pass client-ip=60.248.187.195;
 envelope-from=ruinland@andestech.com; helo=ATCSQR.andestech.com
X-Spam_score_int: 32
X-Spam_score: 3.2
X-Spam_bar: +++
X-Spam_report: (3.2 / 5.0 requ) BAYES_40=-0.001, CHARSET_FARAWAY_HEADER=3.2,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Aug 2021 06:12:18 -0000

--_000_SG2PR03MB4263ED48818608B30AE3C801D5F39SG2PR03MB4263apcp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi Bin and Alistair,

>> Adding Andes AX25 and A25 CPU model into cpu.h and cpu.c without

> The latest RISC-V core from Andes is AX45 and A45. Should we just
> support the latest one?

Maybe we can have them all ?
AX25 and A25 is still in production, and we still have new clients using th=
ese CPU models.

>> +static void ax25_cpu_init(Object *obj)
>nits: for name consistency, should be rv64_andes_ax25_cpu_init()

Will do.


>> +static void a25_cpu_init(Object *obj)
>nits: rv32_andes_a25_cpu_init()

Will do.

> +{
> +    CPURISCVState *env =3D &RISCV_CPU(obj)->env;
> +    set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> +    set_priv_version(env, PRIV_VERSION_1_10_0);
> +}
>  #endif
>

> Regards,
> Bin

My sincere regards,
Ruinland
CONFIDENTIALITY NOTICE:

This e-mail (and its attachments) may contain confidential and legally priv=
ileged information or information protected from disclosure. If you are not=
 the intended recipient, you are hereby notified that any disclosure, copyi=
ng, distribution, or use of the information contained herein is strictly pr=
ohibited. In this case, please immediately notify the sender by return e-ma=
il, delete the message (and any accompanying documents) and destroy all pri=
nted hard copies. Thank you for your cooperation.

Copyright ANDES TECHNOLOGY CORPORATION - All Rights Reserved.

--_000_SG2PR03MB4263ED48818608B30AE3C801D5F39SG2PR03MB4263apcp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Bin&nbsp;and Alistair,</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">&gt;&gt; Adding Andes AX25 and A25 CPU model into =
cpu.h and cpu.c without<br>
<br>
&gt; The latest RISC-V core from Andes is AX45 and A45. Should we just<br>
&gt; support the latest one?</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">Maybe we can have them all ?</div>
<div class=3D"PlainText">AX25 and A25 is still in production,&nbsp;and we s=
till have new clients using these CPU models.<br>
<br>
&gt;&gt; +static void ax25_cpu_init(Object *obj)<br>
&gt;nits: for name consistency, should be rv64_andes_ax25_cpu_init()<br>
<br>
Will do.<br>
<br>
<br>
&gt;&gt; +static void a25_cpu_init(Object *obj)<br>
&gt;nits: rv32_andes_a25_cpu_init()</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">Will do.<br>
<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt;env=
;<br>
&gt; +&nbsp;&nbsp;&nbsp; set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD |=
 RVC | RVS | RVU);<br>
&gt; +&nbsp;&nbsp;&nbsp; set_priv_version(env, PRIV_VERSION_1_10_0);<br>
&gt; +}<br>
&gt;&nbsp; #endif<br>
&gt;<br>
<br>
&gt; Regards,<br>
&gt; Bin<br>
</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">My sincere regards,</div>
<div class=3D"PlainText">Ruinland</div>
</span></font></div>
<div style=3D"background-color:#D5EAFF; border:1px dotted #003333; padding:=
.8em; ">
<span style=3D"font-size:12pt;  font-family: 'Cambria','times new roman','g=
aramond',serif; color:#ff0000;">CONFIDENTIALITY NOTICE:</span><br>
<p style=3D"font-size:11pt; line-height:10pt; font-family: 'Cambria','times=
 roman',serif;">
This e-mail (and its attachments) may contain confidential and legally priv=
ileged information or information protected from disclosure. If you are not=
 the intended recipient, you are hereby notified that any disclosure, copyi=
ng, distribution, or use of the
 information contained herein is strictly prohibited. In this case, please =
immediately notify the sender by return e-mail, delete the message (and any=
 accompanying documents) and destroy all printed hard copies. Thank you for=
 your cooperation.
</p>
<span style=3D"font-size:12pt;  font-family: 'Cambria','times new roman','g=
aramond',serif; color:#ff0000;">Copyright ANDES TECHNOLOGY CORPORATION - Al=
l Rights Reserved.</span><br>
</div>
</body>
</html>

--_000_SG2PR03MB4263ED48818608B30AE3C801D5F39SG2PR03MB4263apcp_--

