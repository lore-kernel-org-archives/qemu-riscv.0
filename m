Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jw3wG-0006IX-MJ
	for mharc-qemu-riscv@gnu.org; Thu, 16 Jul 2020 09:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Pankaj.VJ@exaleapsemi.com>)
 id 1jw3wF-0006IO-Mo
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2020 09:28:39 -0400
Received: from mail-eopbgr1380131.outbound.protection.outlook.com
 ([40.107.138.131]:21152 helo=IND01-MA1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Pankaj.VJ@exaleapsemi.com>)
 id 1jw3wC-0003Y0-Qi
 for qemu-riscv@nongnu.org; Thu, 16 Jul 2020 09:28:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BjlljpeBrWMsQ9922yUd65j6HFWwQEsXCVZrlS43+/y64b/UbWm7KbpuZpqzs4ysEE3OLg8aujUNT+HkvoR9iFl7Ob72TrXCvJ/esFFhRetCaDD2owzLDlLuhJEXLVS+CyApXQjGkQ3PwyZM2HpsFmMio1Yv4A6sjmJ/fzpn4IRsAbcL1PSHhGs7QlXV07a+Pa6+iDj6q0dBN0rfATZp3wXQLwCZ+M39nSpk8nSrZRoILgOfftulfi25Q0Hy0FkHNWKxDtpQr4Tfy6Rfak/X7YZvJnYrPdiEhZVc6YxFPwVsbaANNqMGncM5yTr1wQz8Gqp+4gX3D/3loiXjvy/pag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sN5Qd/vHst5H5RihvU8jgj3oO9pCs1QEikK+Yjna6uo=;
 b=VIWXqJaSc+2lLNIZi0nxSRkZse6LC9TEy3MLG/iHAZ1QC0wz+Sjb39NyCk1XG3dh0xRn1CG5qTEEpKW5FtinAsHlF0W4clwYrzquCM7ML6kj6YkmgBiqczYQlQfSvupgcDl2GjK1W8o5TKUo3HmK0wlSV9sMmLPj9BvCj+fFYhtQIRbNCnpAl6Ua2NfBflRjTThVY3be2GWObZ+HsER1v5GqE9qAprEdqgOIOANRxS299yytVG5F7lssJkJPgr5NDc9YogQ1v8kcLNDvkQSIs8PrTrDu0C4r9WGr/5sWQ6BxwYUQwJlC9n6Oth+v9LvcIPTsHJeerr7KaoFleDRLlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exaleapsemi.com; dmarc=pass action=none
 header.from=exaleapsemi.com; dkim=pass header.d=exaleapsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exaleapsemi.onmicrosoft.com; s=selector2-exaleapsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sN5Qd/vHst5H5RihvU8jgj3oO9pCs1QEikK+Yjna6uo=;
 b=uUTMfchLWOVMsLOzXUBeRRpy4WLfK4jB55UF/uXfARIx3/ISBIBVQB5KsSL+w8nCHU/u/d75pGFFAeZwLrNiMdxRWGkEEU+VzhAXgPpmkWjgXI8EUZ/hA5GFZzbMwsD4WNfv0yLbfemMnotIPiJly42FdBvyC/qIKCT5dBbtmWw=
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:36::20)
 by BM1PR0101MB1601.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Thu, 16 Jul
 2020 13:13:27 +0000
Received: from BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::adf5:6e2d:b2df:3e72]) by BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::adf5:6e2d:b2df:3e72%2]) with mapi id 15.20.3174.025; Thu, 16 Jul 2020
 13:13:27 +0000
From: "Pankaj  Vinadrao Joshi" <Pankaj.VJ@exaleapsemi.com>
To: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Subject: Replacing the existing kernel image with new image
Thread-Topic: Replacing the existing kernel image with new image
Thread-Index: AQHWW1vAv08DcwJVo0WW1/54bZB2IA==
Date: Thu, 16 Jul 2020 13:13:27 +0000
Message-ID: <BMXPR01MB234427906D0FC16A6873B934EE7F0@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none; nongnu.org; dmarc=none action=none header.from=exaleapsemi.com; 
x-originating-ip: [2405:204:95a5:bfae:94d7:75f4:c9e2:209c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89910777-dddf-4afb-f0fe-08d8298a074a
x-ms-traffictypediagnostic: BM1PR0101MB1601:
x-microsoft-antispam-prvs: <BM1PR0101MB1601E836F2364D06D8F53A74EE7F0@BM1PR0101MB1601.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7oLANRwGKO4cJpdc9pj1AM7pUIHC3F/lHd9tXItPZrifHHeOlBwbYPiFduJBMWFHYc44wUcq8OfVXEQDTqc4TsdazchMv6IW27d/GtmQ5tztt1aeMcrwtW68oN3EGhHBC8xejm1sESg6c4y/KHMTks2fRe0swISE4+GGxjK/k+KIAZ0yA/QLmc9+pIY2KGJFRyXhc/5F/G2JyEBQMlAnRq1FwIon0oZ6NRhNV5IdRCd16R5NByakOPsFIhFwrGwI7QypHkjZuW2g1NhRFHvTSkkuq+0jbZX8B3wsEWjUuZCqvJ6VCA9VV4USzSr+m+OiLP69BdCMeIHgK2Lfe6RhZw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39830400003)(366004)(376002)(396003)(346002)(136003)(6506007)(6916009)(7696005)(76116006)(52536014)(66556008)(66946007)(66446008)(33656002)(64756008)(66476007)(316002)(71200400001)(19627405001)(83380400001)(8936002)(9686003)(186003)(508600001)(55016002)(5660300002)(8676002)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: iT3Xf85X0EPdThAfMe7hJNzTHoF61BY+BCm+7FmdIpbSSKFWuvN3ycmAplrdtByp18nR9GmbaWEed45kgj/xe6gw/NYhAmmhiVMXcc0lSxMGCKATmATFZZA544BoGzd1VHiEVdv5PnvXuGxDe/ffDJ9lNazFEPYDUQ9erNeo1PxPb4o5ygnQZ+gJzIdk0WJUAgRXibmoZhx6g2sKZ9KBHa1RrEP3UzQh0EBhA5rLLD3UQB7zIsdNXR/5w5foNy+CYcWmmbQ1DMCB8B2kFd2bDHaqvgIFQXKwD87jm0R0jrNk2QcZ+Q7aD0HiFDdzAgbKodgdyrguj903q/JOHGhwpbDlWeUxlhL8JvD6Yf2usN5X+JDP6Qnf5DBDYNzBjbqne/eEY0VRxbc2kW2wHXVwIwHHIQy9pG+jql1A2Md8uSXrbjlgk+7RV6jbHxPaVWCh5d36BvnU3jMDWE+Ys9gIRfqb+wdYKrXeImbbSCviFAlqy1+oHoD/rp0200eq5Vj10YcpPU2nd/aXsgeiUg1XZa0lJf22hbjhb+usPKGS0UMJD+vdBb8tEen8hpo2YqgF
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BMXPR01MB234427906D0FC16A6873B934EE7F0BMXPR01MB2344INDP_"
MIME-Version: 1.0
X-OriginatorOrg: exaleapsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 89910777-dddf-4afb-f0fe-08d8298a074a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2020 13:13:27.6173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34df156e-9bc4-4450-9e80-487c0e7f9471
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: arf13GLHF2hvZke0AOWk03rRRFO1+uZnbjnwk1NVK97knrY41E8+OTWNP+DN3o/h9JgPDrMJgu/gVmpqzLqL2GmqVW0+RRU6DSX8fX8UVGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR0101MB1601
Received-SPF: pass client-ip=40.107.138.131;
 envelope-from=Pankaj.VJ@exaleapsemi.com;
 helo=IND01-MA1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/16 09:28:33
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 16 Jul 2020 13:28:40 -0000

--_000_BMXPR01MB234427906D0FC16A6873B934EE7F0BMXPR01MB2344INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi ,
I am trying to replace my existing kernel image which is 5.5.6 to 5.5.7 on =
qemuriscv64 i would like to mention i have built my qemu image with openemb=
edded-core.

i have tried to build the kernel 5.5.7 natively,i was able to build the ker=
nel successfully and in my /boot folder i am able to see vmlinux-5.5.7  but=
 now i want to install this image..i have tried to do it by make install i =
didnt got any error with it but when i rebooted my system i am getting

i have followed the following steps to build kernel
$root@qemuriscv64-exaleapsemi-r2:/usr/src/kernel#  make menuconfig arch=3Dr=
iscv64
$root@qemuriscv64-exaleapsemi-r2:/usr/src/kernel# make -j4
$root@qemuriscv64-exaleapsemi-r2:/usr/src/kernel# make modules_install
$root@qemuriscv64-exaleapsemi-r2:/usr/src/kernel# make install
sh ./arch/riscv/boot/install.sh 5.5.7 \
arch/riscv/boot/Image System.map "/boot"
Installing normal kernel

$reboot
13024.451157] printk: systemd-shutdow: 37 output lines suppressed due to ra=
telimiting
[13024.527282] systemd-shutdown[1]: Syncing filesystems and block devices.
[13024.668538] systemd-shutdown[1]: Sending SIGTERM to remaining processes.=
..
[13024.719496] systemd-journald[87]: Received SIGTERM from PID 1 (systemd-s=
hutdow).
[13024.769405] systemd-shutdown[1]: Sending SIGKILL to remaining processes.=
..
[13024.834318] systemd-shutdown[1]: Unmounting file systems.
[13024.868285] [13413]: Remounting '/' read-only in with options '(null)'.
[13025.228499] EXT4-fs (vda): re-mounted. Opts: (null)
[13025.358123] systemd-shutdown[1]: All filesystems unmounted.
[13025.358576] systemd-shutdown[1]: Deactivating swaps.
[13025.361264] systemd-shutdown[1]: All swaps deactivated.
[13025.361727] systemd-shutdown[1]: Detaching loop devices.
[13025.420602] systemd-shutdown[1]: All loop devices detached.
[13025.421071] systemd-shutdown[1]: Detaching DM devices.
[13025.595237] reboot: Restarting system
[13046.599875] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[13046.600329] (detected by 0, t=3D5252 jiffies, g=3D2837145, q=3D17)
[13046.600763] rcu: All QSes seen, last rcu_sched kthread activity 5252 (42=
98153942-4298148690), jiffies_till_next_fqs=3D1, root ->qsmask 0x0
[13046.601503] systemd-shutdow R  running task        0     1      0 0x0000=
0008
[13046.602053] Call Trace:
[13046.602562] [<ffffffe00006d3fc>] walk_stackframe+0x0/0xa4
[13046.602890] [<ffffffe00006d5e2>] show_stack+0x2a/0x34
[13046.603156] [<ffffffe000091094>] sched_show_task+0x158/0x174
[13046.603442] [<ffffffe0000c4dde>] rcu_sched_clock_irq+0x6b2/0x6ec
[13046.603740] [<ffffffe0000ccadc>] update_process_times+0x1e/0x44
[13046.604009] [<ffffffe0000d79dc>] tick_sched_handle.isra.16+0x30/0x3e
[13046.604331] [<ffffffe0000d7a38>] tick_sched_timer+0x4e/0x94
[13046.604620] [<ffffffe0000cd44a>] __hrtimer_run_queues+0x10c/0x2de
[13046.604928] [<ffffffe0000cdc96>] hrtimer_interrupt+0xcc/0x1d6
[13046.605236] [<ffffffe0005d3f7c>] riscv_timer_interrupt+0x32/0x3a
[13046.605580] [<ffffffe0007889ce>] do_IRQ+0xae/0xba
[13046.605837] [<ffffffe00006bd3c>] ret_from_exception+0x0/0xc
[13046.606127] [<ffffffe00006ca58>] machine_restart+0xc/0xe
[13046.606508] rcu: rcu_sched kthread starved for 5252 jiffies! g2837145 f0=
x2 RCU_GP_WAIT_FQS(5) ->state=3D0x0 ->cpu=3D0
[13046.606990] rcu: RCU grace-period kthread stack dump:
[13046.607257] rcu_sched       R  running task        0    10      2 0x0000=
0000
[13046.607610] Call Trace:
[13046.607774] [<ffffffe000784258>] __schedule+0x1a8/0x482
[13046.608044] [<ffffffe000784592>] schedule+0x60/0xda
[13046.608304] [<ffffffe000787a56>] schedule_timeout+0x15c/0x2b2
[13046.608602] [<ffffffe0000c2ec8>] rcu_gp_kthread+0x4cc/0x7ec
[13046.608889] [<ffffffe00008b0f2>] kthread+0xf0/0x102
[13046.609162] [<ffffffe00006bd3c>] ret_from_exception+0x0/0xc


Can someone help me out how i can replace my kernel to 5.5.7 since i am not=
 able to find grub or grub2 on my riscv platform?? i have googled for the s=
olution but most of them seems to be x86 specific where they are tryying to=
 change the grub??Where i should modify for riscv to get my kernel up????

Thanks

--_000_BMXPR01MB234427906D0FC16A6873B934EE7F0BMXPR01MB2344INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi ,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
I am trying to replace my existing kernel image which is 5.5.6 to 5.5.7 on =
qemuriscv64 i would like to mention i have built my qemu image with openemb=
edded-core.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
i have tried to build the kernel 5.5.7 natively,i was able to build the ker=
nel successfully and in my /boot folder i am able to see vmlinux-5.5.7&nbsp=
; but now i want to install this image..i have tried to do it by make insta=
ll i didnt got any error with it but
 when i rebooted my system i am getting&nbsp;</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
i have followed the following steps to build kernel</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
$<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; backgro=
und-color: rgb(255, 255, 255); display: inline !important">root@qemuriscv64=
-exaleapsemi-r2:/usr/src/kernel#&nbsp;&nbsp;</span>make menuconfig arch=3Dr=
iscv64</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
$<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; backgro=
und-color: rgb(255, 255, 255); display: inline !important">root@qemuriscv64=
-exaleapsemi-r2:/usr/src/kernel#&nbsp;</span>make -j4</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
$<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; backgro=
und-color: rgb(255, 255, 255); display: inline !important">root@qemuriscv64=
-exaleapsemi-r2:/usr/src/kernel#&nbsp;</span>make modules_install</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt;">$root@qemuriscv64-exaleapsemi-r2:/usr/src/kernel# make install</s=
pan><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif; background-color: rgb(255, 255, 255)">
sh ./arch/riscv/boot/install.sh 5.5.7 \</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif; background-color: rgb(255, 255, 255)">
arch/riscv/boot/Image System.map &quot;/boot&quot;</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif; background-color: rgb(255, 255, 255)">
Installing normal kernel</div>
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif;">$reboot=
</span><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<div style=3D"margin: 0px; font-family: Calibri, Arial, Helvetica, sans-ser=
if; background-color: rgb(255, 255, 255)">
<span style=3D"margin: 0px">13024.451157] printk: systemd-shutdow: 37 outpu=
t lines suppressed due to ratelimiting<br>
</span>
<div style=3D"margin: 0px">[13024.527282] systemd-shutdown[1]: Syncing file=
systems and block devices.<br>
</div>
<div style=3D"margin: 0px">[13024.668538] systemd-shutdown[1]: Sending SIGT=
ERM to remaining processes...<br>
</div>
<div style=3D"margin: 0px">[13024.719496] systemd-journald[87]: Received SI=
GTERM from PID 1 (systemd-shutdow).<br>
</div>
<div style=3D"margin: 0px">[13024.769405] systemd-shutdown[1]: Sending SIGK=
ILL to remaining processes...<br>
</div>
<div style=3D"margin: 0px">[13024.834318] systemd-shutdown[1]: Unmounting f=
ile systems.<br>
</div>
<div style=3D"margin: 0px">[13024.868285] [13413]: Remounting '/' read-only=
 in with options '(null)'.<br>
</div>
<div style=3D"margin: 0px">[13025.228499] EXT4-fs (vda): re-mounted. Opts: =
(null)<br>
</div>
<div style=3D"margin: 0px">[13025.358123] systemd-shutdown[1]: All filesyst=
ems unmounted.<br>
</div>
<div style=3D"margin: 0px">[13025.358576] systemd-shutdown[1]: Deactivating=
 swaps.<br>
</div>
<div style=3D"margin: 0px">[13025.361264] systemd-shutdown[1]: All swaps de=
activated.<br>
</div>
<div style=3D"margin: 0px">[13025.361727] systemd-shutdown[1]: Detaching lo=
op devices.<br>
</div>
<div style=3D"margin: 0px">[13025.420602] systemd-shutdown[1]: All loop dev=
ices detached.<br>
</div>
<div style=3D"margin: 0px">[13025.421071] systemd-shutdown[1]: Detaching DM=
 devices.<br>
</div>
<div style=3D"margin: 0px">[13025.595237] reboot: Restarting system<br>
</div>
<div style=3D"margin: 0px">[13046.599875] rcu: INFO: rcu_sched detected sta=
lls on CPUs/tasks:<br>
</div>
<div style=3D"margin: 0px">[13046.600329] (detected by 0, t=3D5252 jiffies,=
 g=3D2837145, q=3D17)<br>
</div>
<div style=3D"margin: 0px">[13046.600763] rcu: All QSes seen, last rcu_sche=
d kthread activity 5252 (4298153942-4298148690), jiffies_till_next_fqs=3D1,=
 root -&gt;qsmask 0x0<br>
</div>
<div style=3D"margin: 0px">[13046.601503] systemd-shutdow R &nbsp;running t=
ask &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp; 1 &nbsp; &nbsp; &nbsp;0 0x00=
000008<br>
</div>
<div style=3D"margin: 0px">[13046.602053] Call Trace:<br>
</div>
<div style=3D"margin: 0px">[13046.602562] [&lt;ffffffe00006d3fc&gt;] walk_s=
tackframe&#43;0x0/0xa4<br>
</div>
<div style=3D"margin: 0px">[13046.602890] [&lt;ffffffe00006d5e2&gt;] show_s=
tack&#43;0x2a/0x34<br>
</div>
<div style=3D"margin: 0px">[13046.603156] [&lt;ffffffe000091094&gt;] sched_=
show_task&#43;0x158/0x174<br>
</div>
<div style=3D"margin: 0px">[13046.603442] [&lt;ffffffe0000c4dde&gt;] rcu_sc=
hed_clock_irq&#43;0x6b2/0x6ec<br>
</div>
<div style=3D"margin: 0px">[13046.603740] [&lt;ffffffe0000ccadc&gt;] update=
_process_times&#43;0x1e/0x44<br>
</div>
<div style=3D"margin: 0px">[13046.604009] [&lt;ffffffe0000d79dc&gt;] tick_s=
ched_handle.isra.16&#43;0x30/0x3e<br>
</div>
<div style=3D"margin: 0px">[13046.604331] [&lt;ffffffe0000d7a38&gt;] tick_s=
ched_timer&#43;0x4e/0x94<br>
</div>
<div style=3D"margin: 0px">[13046.604620] [&lt;ffffffe0000cd44a&gt;] __hrti=
mer_run_queues&#43;0x10c/0x2de<br>
</div>
<div style=3D"margin: 0px">[13046.604928] [&lt;ffffffe0000cdc96&gt;] hrtime=
r_interrupt&#43;0xcc/0x1d6<br>
</div>
<div style=3D"margin: 0px">[13046.605236] [&lt;ffffffe0005d3f7c&gt;] riscv_=
timer_interrupt&#43;0x32/0x3a<br>
</div>
<div style=3D"margin: 0px">[13046.605580] [&lt;ffffffe0007889ce&gt;] do_IRQ=
&#43;0xae/0xba<br>
</div>
<div style=3D"margin: 0px">[13046.605837] [&lt;ffffffe00006bd3c&gt;] ret_fr=
om_exception&#43;0x0/0xc<br>
</div>
<div style=3D"margin: 0px">[13046.606127] [&lt;ffffffe00006ca58&gt;] machin=
e_restart&#43;0xc/0xe<br>
</div>
<div style=3D"margin: 0px">[13046.606508] rcu: rcu_sched kthread starved fo=
r 5252 jiffies! g2837145 f0x2 RCU_GP_WAIT_FQS(5) -&gt;state=3D0x0 -&gt;cpu=
=3D0<br>
</div>
<div style=3D"margin: 0px">[13046.606990] rcu: RCU grace-period kthread sta=
ck dump:<br>
</div>
<div style=3D"margin: 0px">[13046.607257] rcu_sched &nbsp; &nbsp; &nbsp; R =
&nbsp;running task &nbsp; &nbsp; &nbsp; &nbsp;0 &nbsp; &nbsp;10 &nbsp; &nbs=
p; &nbsp;2 0x00000000<br>
</div>
<div style=3D"margin: 0px">[13046.607610] Call Trace:<br>
</div>
<div style=3D"margin: 0px">[13046.607774] [&lt;ffffffe000784258&gt;] __sche=
dule&#43;0x1a8/0x482<br>
</div>
<div style=3D"margin: 0px">[13046.608044] [&lt;ffffffe000784592&gt;] schedu=
le&#43;0x60/0xda<br>
</div>
<div style=3D"margin: 0px">[13046.608304] [&lt;ffffffe000787a56&gt;] schedu=
le_timeout&#43;0x15c/0x2b2<br>
</div>
<div style=3D"margin: 0px">[13046.608602] [&lt;ffffffe0000c2ec8&gt;] rcu_gp=
_kthread&#43;0x4cc/0x7ec<br>
</div>
<div style=3D"margin: 0px">[13046.608889] [&lt;ffffffe00008b0f2&gt;] kthrea=
d&#43;0xf0/0x102<br>
</div>
<div style=3D"margin: 0px">[13046.609162] [&lt;ffffffe00006bd3c&gt;] ret_fr=
om_exception&#43;0x0/0xc</div>
</div>
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Can someone help me out how i can replace my kernel to 5.5.7 since i am not=
 able to find grub or grub2 on my riscv platform?? i have googled for the s=
olution but most of them seems to be x86 specific where they are tryying to=
 change the grub??Where i should
 modify for riscv to get my kernel up????</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thanks</div>
</body>
</html>

--_000_BMXPR01MB234427906D0FC16A6873B934EE7F0BMXPR01MB2344INDP_--

