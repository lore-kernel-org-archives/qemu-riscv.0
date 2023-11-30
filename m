Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB34C4167B
	for <qemu-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 12:52:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8gWS-0007jo-Os; Thu, 30 Nov 2023 07:52:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1r8d9H-0003gZ-9f; Thu, 30 Nov 2023 04:15:55 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1r8d9D-0007gt-JF; Thu, 30 Nov 2023 04:15:54 -0500
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AU9CGNH028745; Thu, 30 Nov 2023 09:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=U7xhAiXyHYuSi9gQG6NV4CZH7LkdmdMB32D1ZOqvl2E=;
 b=AFBdvLera18ekFkEDQHSP2T6dJxy+bj5KW/jP/YQxVyqxiHZtRJXrFC+0ntnZuEvmXMl
 m5dICRXNSmZBGnKsumVVgBAXL4u0dvBZSGFJjow9KpyWozqGgg5e9lV0A3P1DYtJVgrk
 fcIAkenPAVxLZnA9inVImJFIRFFp84wVlNbQYq2PnUAD94eddwhNGmE1WEaq+o2oyHt9
 lgMLNpBO+kPcZI3+78p/T21qN3TQ/nrMIklnS6Mpmi8dOIQR1PJPM8F2VFLdmlnmfYt2
 bNGyD4yvrGuvjfFw260kty5gkpovVQqcuoFvY7pDIz7evPqH74AstesKRFOdN22SZxO6 0g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3upqj4g6aa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Nov 2023 09:14:59 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AU9CSaJ029884;
 Thu, 30 Nov 2023 09:14:58 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3upqj4g684-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Nov 2023 09:14:58 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AU7Xw9A030737; Thu, 30 Nov 2023 09:14:55 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uku8tddeu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Nov 2023 09:14:55 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3AU9EqIJ6750948
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Nov 2023 09:14:52 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F14720043;
 Thu, 30 Nov 2023 09:14:52 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CB6D20040;
 Thu, 30 Nov 2023 09:14:48 +0000 (GMT)
Received: from [9.171.32.92] (unknown [9.171.32.92])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 30 Nov 2023 09:14:48 +0000 (GMT)
Message-ID: <c3ac8d9c2b9d611e84672436ce1a96aedcaacf5e.camel@linux.ibm.com>
Subject: Re: [PATCH 2/6] qemu/main-loop: rename QEMU_IOTHREAD_LOCK_GUARD to
 QEMU_BQL_LOCK_GUARD
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>, Fabiano Rosas
 <farosas@suse.de>, qemu-s390x@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas Huth
 <thuth@redhat.com>, Hyman Huang <yong.huang@smartx.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, David Woodhouse <dwmw2@infradead.org>, Andrey
 Smirnov <andrew.smirnov@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Paul Durrant <paul@xen.org>, Jagannathan Raman
 <jag.raman@oracle.com>, Juan Quintela <quintela@redhat.com>, "Daniel P."
 =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Daniel
 Henrique Barboza <danielhb413@gmail.com>, Elena Ufimtseva
 <elena.ufimtseva@oracle.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>, Roman Bolshakov
 <rbolshakov@ddn.com>, Huacai Chen <chenhuacai@kernel.org>, Fam Zheng
 <fam@euphon.net>, Eric Blake <eblake@redhat.com>, Jiri Slaby
 <jslaby@suse.cz>, Alexander Graf <agraf@csgraf.de>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, Eric
 Farman <farman@linux.ibm.com>, Stafford Horne <shorne@gmail.com>, David
 Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Cameron Esfahani <dirty@apple.com>, xen-devel@lists.xenproject.org, Pavel
 Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-riscv@nongnu.org, Aleksandar
 Rikalo <aleksandar.rikalo@syrmia.com>, John Snow <jsnow@redhat.com>, Sunil
 Muthuswamy <sunilmut@microsoft.com>, Michael Roth <michael.roth@amd.com>,
 David Gibson <david@gibson.dropbear.id.au>, "Michael S. Tsirkin"
 <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Bin
 Meng <bin.meng@windriver.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org,
 qemu-block@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, =?ISO-8859-1?Q?C=E9dric?=
 Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Leonardo Bras <leobras@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Thu, 30 Nov 2023 10:14:47 +0100
In-Reply-To: <20231129212625.1051502-3-stefanha@redhat.com>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-3-stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: k5g-bglZZ81amYqAueJeLCJOKEKz4uGW
X-Proofpoint-GUID: hyHEB3c1P1gBAyQsdYHk4l82Bt-Qzmtx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_07,2023-11-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1011 impostorscore=0
 phishscore=0 mlxlogscore=810 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311300068
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 30 Nov 2023 07:51:59 -0500
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

On Wed, 2023-11-29 at 16:26 -0500, Stefan Hajnoczi wrote:
> The name "iothread" is overloaded. Use the term Big QEMU Lock (BQL)
> instead, it is already widely used and unambiguous.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> =C2=A0include/qemu/main-loop.h=C2=A0 | 20 ++++++++++----------
> =C2=A0hw/i386/kvm/xen_evtchn.c=C2=A0 | 14 +++++++-------
> =C2=A0hw/i386/kvm/xen_gnttab.c=C2=A0 |=C2=A0 2 +-
> =C2=A0hw/mips/mips_int.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
> =C2=A0hw/ppc/ppc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0target/i386/kvm/xen-emu.c |=C2=A0 2 +-
> =C2=A0target/ppc/excp_helper.c=C2=A0 |=C2=A0 2 +-
> =C2=A0target/ppc/helper_regs.c=C2=A0 |=C2=A0 2 +-
> =C2=A0target/riscv/cpu_helper.c |=C2=A0 4 ++--
> =C2=A09 files changed, 25 insertions(+), 25 deletions(-)
>=20
> diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
> index d6f75e57bd..0b6a3e4824 100644
> --- a/include/qemu/main-loop.h
> +++ b/include/qemu/main-loop.h
> @@ -344,13 +344,13 @@ void qemu_bql_lock_impl(const char *file, int
> line);
> =C2=A0void qemu_bql_unlock(void);
> =C2=A0
> =C2=A0/**
> - * QEMU_IOTHREAD_LOCK_GUARD
> + * QEMU_BQL_LOCK_GUARD
> =C2=A0 *
> - * Wrap a block of code in a conditional
> qemu_mutex_{lock,unlock}_iothread.
> + * Wrap a block of code in a conditional qemu_bql_{lock,unlock}.
> =C2=A0 */
> -typedef struct IOThreadLockAuto IOThreadLockAuto;
> +typedef struct BQLLockAuto BQLLockAuto;
> =C2=A0
> -static inline IOThreadLockAuto *qemu_iothread_auto_lock(const char
> *file,
> +static inline BQLLockAuto *qemu_bql_auto_lock(const char *file,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int line)

The padding is not correct anymore.

Other than this:

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>

