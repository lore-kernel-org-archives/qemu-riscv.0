Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61704C4167B
	for <qemu-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 14:55:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rAWpZ-0005H2-PN; Tue, 05 Dec 2023 09:55:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eliovinciguerra@me.com>)
 id 1rAUyg-0000X5-OB
 for qemu-riscv@nongnu.org; Tue, 05 Dec 2023 07:56:42 -0500
Received: from qs51p00im-qukt01080502.me.com ([17.57.155.23])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eliovinciguerra@me.com>)
 id 1rAUyf-0006qx-0f
 for qemu-riscv@nongnu.org; Tue, 05 Dec 2023 07:56:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1701780998; bh=k1AQhtfPcX5fvLYUZhXRVb+R09qrRyC2zmbilxLmd2I=;
 h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type;
 b=nQGFZRefv7ghJmkWVOnRub6Cx+yl6a0J4oiDc2Cnx+NY1/zOV7DJjeQU5nUk59l38
 FdGBInuHbPnGskiJOxYQww5p6yyII1H29y8Z5y+TyZCzFQraVX9TnTqMmThpJbiNh2
 6c7WYm2mobSbYn7OOW11Rw4VLimG2HklgABKo+y2UYNhcyzNcgsDovaBK8hmZb5gHh
 c4UTjVR8KKTCa+3GS4fcG6sdgLkAZXiujPzDxiQHplH1bkMPIRgdejk8AxC4pQyPD/
 UbyBSPor06mPa0/hKTy7Iqycs+lhkCNIiB7PYnN34HhTjuGn6hs7PklLqrlGcOr5d3
 999hYDivqBevg==
Received: from [192.168.1.57] (qs51p00im-dlb-asmtp-mailmevip.me.com
 [17.57.155.28])
 by qs51p00im-qukt01080502.me.com (Postfix) with ESMTPSA id 3D6CB4E402B2;
 Tue,  5 Dec 2023 12:56:36 +0000 (UTC)
Date: Tue, 5 Dec 2023 13:56:13 +0100
From: Elio Vinciguerra <eliovinciguerra@me.com>
To: ELIO VINCIGUERRA <elio.vinciguerra@phd.unict.it>, Atish Patra
 <atishp@atishpatra.org>
Cc: "=?utf-8?Q?qemu-riscv=40nongnu.org?=" <qemu-riscv@nongnu.org>
Message-ID: <61ae4c15-c251-43a6-aa98-b12ea5feb246@Spark>
In-Reply-To: <CAOnJCUL_kg08aQoNosbTgT64O508kQ58-MtT29fBsD+f8dqyoQ@mail.gmail.com>
References: <25092274-76c6-4d34-a3c4-cae3214bc277@Spark>
 <CAOnJCUL_kg08aQoNosbTgT64O508kQ58-MtT29fBsD+f8dqyoQ@mail.gmail.com>
Subject: Re: About =?utf-8?Q?RISCV=E2=80=99s_?=Performance Counters and
 QEMU
X-Readdle-Message-ID: 61ae4c15-c251-43a6-aa98-b12ea5feb246@Spark
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="656f1dfe_34fef653_1fd"
X-Proofpoint-GUID: bUZEHWS1POGhhXgf8M0YzwOlFc2m_Lp7
X-Proofpoint-ORIG-GUID: bUZEHWS1POGhhXgf8M0YzwOlFc2m_Lp7
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 clxscore=1031 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2312050100
Received-SPF: pass client-ip=17.57.155.23; envelope-from=eliovinciguerra@me.com;
 helo=qs51p00im-qukt01080502.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 05 Dec 2023 09:55:23 -0500
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

--656f1dfe_34fef653_1fd
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Thanks for your answer, do you know if the working ones return actual or =
random numbers=3F

And do you know if it is easily possible to implement the actual behavior=
 of other counters=3F

Regards,
Elio
Il 4 dic 2023, 9:30=E2=80=AFAM +0100, Atish Patra <atishp=40atishpatra.or=
g>, ha scritto:
> On =46ri, Dec 1, 2023 at 7:57=E2=80=AFAM ELIO VINCIGUERRA
> <elio.vinciguerra=40phd.unict.it> wrote:
> >
> > Hi everybody, I recently started using RISCV architectures, I would n=
eed a way to access =E2=80=9Chpmcounter=5B3-31=5D=E2=80=9D registers usin=
g QEMU emulator.
> >
> > The kernel used for simulations is a C program, not a heavy operating=
 system, which is why I would need to access the registers mentioned befo=
re via assembly.
> >
> > Trivially accessing any of those registers always returns zero.
> >
> > The question is:
> > Are these registers enabled in QEMU=3F If not, is it possible to enab=
le them or are they hardwired to zero=3F How=3F
> >
> > Trying to access the registers =E2=80=9Ccycle=E2=80=9D, =E2=80=9Cinst=
ret=E2=80=9D and =E2=80=9Ctime=E2=80=9D the values come out to be non-zer=
o, which is why I think it is also possible to enable =E2=80=9Chpmcounter=
=5B3-31=5D=E2=80=9D, but the mode of operation is unknown to me, can anyo=
ne help me=3F
> >
>
> Yes. You can use all the hpmcounters=5B3-31=5D. By default,
> hpmcounter=5B3-18=5D are enabled. You can modify the set of counters us=
ing
> pmu-mask cpu property.
> https://gitlab.com/qemu-project/qemu/-/blob/master/target/riscv/cpu.c=3F=
ref=5Ftype=3Dheads=23L1467
>
> However, upstream Qemu doesn't support a lot of PMU events. It only
> supports 3 cache related events apart from cycle/instret.
>
> Here are the events it supports.
> https://gitlab.com/qemu-project/qemu/-/blob/master/target/riscv/pmu.c=3F=
ref=5Ftype=3Dheads=23L36
>
> > Regards,
> > Elio
>
>
>
> --
> Regards,
> Atish

--656f1dfe_34fef653_1fd
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html xmlns=3D=22http://www.w3.org/1999/xhtml=22>
<head>
<title></title>
</head>
<body>
<div name=3D=22messageBodySection=22>
<div dir=3D=22auto=22>Thanks for your answer, do you know if the working =
ones return actual or random numbers=3F<br />
<br />
And do you know if it is easily possible to implement the actual behavior=
 of other counters=3F<br />
<br />
Regards,<br />
Elio</div>
</div>
<div name=3D=22messageReplySection=22>Il 4 dic 2023, 9:30=E2=80=AFAM +010=
0, Atish Patra &lt;atishp=40atishpatra.org&gt;, ha scritto:<br />
<blockquote type=3D=22cite=22 style=3D=22border-left-color: grey; border-=
left-width: thin; border-left-style: solid; margin: 5px 5px;padding-left:=
 10px;=22>On =46ri, Dec 1, 2023 at 7:57=E2=80=AFAM ELIO VINCIGUERRA<br />=

&lt;elio.vinciguerra=40phd.unict.it&gt; wrote:<br />
<blockquote type=3D=22cite=22><br />
Hi everybody, I recently started using RISCV architectures, I would need =
a way to access =E2=80=9Chpmcounter=5B3-31=5D=E2=80=9D registers using QE=
MU emulator.<br />
<br />
The kernel used for simulations is a C program, not a heavy operating sys=
tem, which is why I would need to access the registers mentioned before v=
ia assembly.<br />
<br />
Trivially accessing any of those registers always returns zero.<br />
<br />
The question is:<br />
Are these registers enabled in QEMU=3F If not, is it possible to enable t=
hem or are they hardwired to zero=3F How=3F<br />
<br />
Trying to access the registers =E2=80=9Ccycle=E2=80=9D, =E2=80=9Cinstret=E2=
=80=9D and =E2=80=9Ctime=E2=80=9D the values come out to be non-zero, whi=
ch is why I think it is also possible to enable =E2=80=9Chpmcounter=5B3-3=
1=5D=E2=80=9D, but the mode of operation is unknown to me, can anyone hel=
p me=3F<br />
<br /></blockquote>
<br />
Yes. You can use all the hpmcounters=5B3-31=5D. By default,<br />
hpmcounter=5B3-18=5D are enabled. You can modify the set of counters usin=
g<br />
pmu-mask cpu property.<br />
https://gitlab.com/qemu-project/qemu/-/blob/master/target/riscv/cpu.c=3Fr=
ef=5Ftype=3Dheads=23L1467<br />
<br />
However, upstream Qemu doesn't support a lot of PMU events. It only<br />=

supports 3 cache related events apart from cycle/instret.<br />
<br />
Here are the events it supports.<br />
https://gitlab.com/qemu-project/qemu/-/blob/master/target/riscv/pmu.c=3Fr=
ef=5Ftype=3Dheads=23L36<br />
<br />
<blockquote type=3D=22cite=22>Regards,<br />
Elio<br /></blockquote>
<br />
<br />
<br />
--<br />
Regards,<br />
Atish<br /></blockquote>
</div>
</body>
</html>

--656f1dfe_34fef653_1fd--


