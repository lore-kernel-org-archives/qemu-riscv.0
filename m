Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF43C5CFC1
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 18:35:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuwjd-0005lL-OW; Fri, 14 Aug 2026 14:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wuwjX-0005jo-RO
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 14:34:24 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wuwjU-0005b6-Em
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 14:34:22 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67EGhjbf2282725
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 18:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 U4G1uVGruvh0qZc8vFnL0duJ+btrTB22H6TndNU7u2w=; b=j8O8hpmqlpZooloJ
 7P4hwZzr7lJAic2HLilbuwN5l1DbPzINzoENedrZ6JesapzWuCtth35sKc2y196j
 8oyPM9Ziod/AA/jDQ7ewrSQm4Z7kHev2WksracgdvIKAIP5jE3/xQmx08E8xKfBV
 NWqcqaeyP9AdvYRlP7gO52yqSOJMIPFm+B7LBUGK/xr4TmjuIrdy4tHJzDngpGqr
 jQAmnxEWOeUPaN7ok2o4Dcm4p7G7QACOaLdhpib5doI+keMPg0bHh5N+ngJhSDdx
 kJMgxEdwtdsq29rko+jKQLMZxYI0/I+rGvVIcLl/YvLrY+hRjuja3XyHuGgPYpdS
 LTsLkA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1xexjwty-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 18:34:17 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-97bf8fb7445so25097241.1
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 11:34:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786732456; cv=none;
 d=google.com; s=arc-20260327;
 b=LX2vKHL8XWrGr0QpQppSaBil0XF71G6lFK2MLkLx8udh80A+E3ntUi4fpEsn13CtdE
 tSezefGHzthH69oDp407bWFRLxhLs9gf3Kjy8KgKR8V+jke5izd6GuD14rqoXWfyGLsr
 It/iphCQHaqbAwYpbvSdqKdF4lesqJoQff9PcYI8NpPZ4vd4uzHAfaVGyXfvbCMhjTS8
 pNLYVGt7ykyhORDfQT9GSdVjXssn2ki9/ybEgkhbeX9MjEcR1p3pC5BkdRLQVGFyxAOS
 uP6Nt+AQwD1c6VG9cezRdIuyAqLYY/8iqc9JBIMkVs9w78R02dipOPtS7Nj1bQNYjS1X
 /rtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=U4G1uVGruvh0qZc8vFnL0duJ+btrTB22H6TndNU7u2w=;
 fh=+jnJZRWdG55DF5qo9EVaIvQDN1LKFt2TLd1wdyE9BhM=;
 b=CDylvGrIDk8ciwO3InuciGcARnPKvImeCk05Wpx9+Sw7eoXC+NsOO/YwXRmnrycpFc
 xioGtzhY01vQ3cE1/5LLx9z5usWuFS0zgCtaJrv0nswSKa0lrueuGSoVkGTx78QvXbtJ
 D2kqUB1vTDh176enLy4SBMw1xYUm+WCLmE3lFoeOvY82U7UrJkHpsZ0anTLpLTxJ3Lwg
 cyfCLgJ5P63iNIUadr8KCo7boqNueNMbZ6AhslSNb7fjfevVQQxSvDDPl3mookYepzxi
 EwIO7bMtzza7eGQINoYCmBSmm9Ev3r7zToN6XyHt5i827YEaQr8kdgi0/MqXwZuaGCjD
 IljQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786732456; x=1787337256; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=U4G1uVGruvh0qZc8vFnL0duJ+btrTB22H6TndNU7u2w=;
 b=XbSrXN4/s4wLUOt+gNIRPBCheTmB769ZdP7DD/VnnygqSKyRCcS+7kSkcCAR4zV4V6
 d8SULUptiZIRwEMlDlNxadCxtUXkpbcyl5l6z5L+60WcN/xnBiji9R7Db/W+Rxs8kcl9
 nFj4uliqy9YBcNWcjAxr9PiHzSfnvZZn2yU+Tirtq5lquhN9BWnvkYmYf9ClbG5T2b0i
 /9+tFe1ZUrHKXnJtpSEPzFuqt+pnF6Q/dblMqO0YGvTqAkEKPEzCOEol9fyKzUGzCrqj
 TeVXJ+2XEAyKM7nF2JxVYoYeIayEv+gmUsgTVAKjGYSNxpAIOurQupQpPu9TeXSTuSrU
 Py0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786732456; x=1787337256;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=U4G1uVGruvh0qZc8vFnL0duJ+btrTB22H6TndNU7u2w=;
 b=GWd4UjYLVwBzpzhprxIM54CBXBi49NImD//RwI7kWzFZVSuuvDr26P4HYEz3ualnOS
 kxjIVAP7CRKZG9svW5BUxE/bRTHwq0TnGs4/bsXhaSsGV9k81TgOdiGTBsB8H/0J2PNn
 EXOQFGWlwnR4wZNl6hAzAQixDn0SyAsHuyTX91EhtBv1f6OiCDA5sRwKQKZ5yUeNFDfh
 73rRAvtzPHUw8AktbYCU69BP4E1Prb+1bChXHl4nbtBxiUOQGmZ84sg1FVILikDhHv0e
 ARpBkcA/BT5DAaV7jtOcw6usT3SweOO1qyLvL//9epqJk2sL4ja3IiSylWctfqQrq1Dm
 RR9w==
X-Gm-Message-State: AOJu0YwCSQ6JvgrU6+loIrE0V6SPe5ARHvdoy4SA1xQ0O/SxuQR0m8Bh
 jvVaNVFXr3dfdDFm/QH6TV+jZEDZMFzsV8DGqMZiG7EsxuZppSQkdkAFgV0YJzpO91B+N10pWfk
 n1YCVWQBHe8BUOU/0v3VSjjgftsV+baeONjVgYTd/O2qris6/EXl6PKo9fN2K3GGo3ySOMfz3rU
 ROK+c/D6AOHIbVo9M0rhb6zox1dw5ET3iV
X-Gm-Gg: AR+sD10xm9rPeX9Y7yT8QLSgLVRq1ascPYjdAjOSYbjD/vcj/MvFKgJeWWpyaPUvKfX
 W7h5t7YNChZlQOXuVc111hKlROddW/NrLEtrJTsXVn8I5dYUD8uiUuYMz1m0tTXRwua37bK4FvK
 9/rF+nVCwb0/n5IDMzAaVIDoy82WTeYRYt9LBSsLZmMEGyDSyBGlOsMIt78Q==
X-Received: by 2002:a05:6102:4188:b0:738:a78f:5483 with SMTP id
 ada2fe7eead31-76f2ce65b88mr684431137.2.1786732456338; 
 Fri, 14 Aug 2026 11:34:16 -0700 (PDT)
X-Received: by 2002:a05:6102:4188:b0:738:a78f:5483 with SMTP id
 ada2fe7eead31-76f2ce65b88mr684420137.2.1786732455921; Fri, 14 Aug 2026
 11:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260814045315.3416169-1-subrahmanya.lingappa@oss.qualcomm.com>
 <20260814045315.3416169-2-subrahmanya.lingappa@oss.qualcomm.com>
 <7c5a0b1d-12db-4be2-b20c-9d132b027a76@oss.qualcomm.com>
In-Reply-To: <7c5a0b1d-12db-4be2-b20c-9d132b027a76@oss.qualcomm.com>
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Date: Sat, 15 Aug 2026 00:04:04 +0530
X-Gm-Features: AcwNN1UPug99xyeQLZmCXnQBRAhGbq4tYGvK2y0q-y-4rfGcZh2DnyZUkvKMl34
Message-ID: <CAPxK-6c5ucsJttV6WVTQSe=O3s+q-tL=-Mv42iJPUBftFAXFhA@mail.gmail.com>
Subject: Re: [PATCH v8 01/10] build: add optional librpmi dependency
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDE0MiBTYWx0ZWRfXzfYjXDp4PZ1T
 jZTHgh9+CQwR66N9BMXmWbN3tQf8R1N/eTxyFDtNA5azxPpKKDyAqCJW47+iMAB6O81a73Vr6fe
 TfuP+gIa27fm+YIWKcs4yJgaPAcveyE=
X-Proofpoint-GUID: cM6tbeVbiEQk3Ba4F7MPU6aDgdESgiEe
X-Authority-Analysis: v=2.4 cv=eO4jSnp1 c=1 sm=1 tr=0 ts=6a7f5fa9 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=355me-iAcZ-xxilroeMA:9
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDE0MiBTYWx0ZWRfXx4R49zH7myAj
 hnDA4UXdmXNjQR4rwffxKv/t6ddKN7VYsT3+DjX0TGkECpdTEF8vmZgorZ74/nqDTdY2b7wxFZ1
 iRNJq9HMd8vpoEka76k2VhR2xlfZHL0WYvaE9uhHPcI4BBljONkEZkX44isrfhAbK+bz0hGRArb
 KHBYAI0VNz2sEfWwetzhrAAT/1d9c+YXQDelJUpyqp3pkqzD7GumoC4+9uN0i86OAT4B7ExDOpN
 GijPgyFzLADFOjj4uf1AFLZ/qPRTQ4nxrZveXemkQzrmDTOUiD+fwMtzRjyfcduQ8VOk0qiUTd5
 MeEdRK7U/LTG81GyLmFTS8A7kZ9jyERpU+rzpTuzgSjVVvjP1FkCa2QMvPYJewnk89zPHhrldEV
 Oz4rSOnNW++XqeCBJrRn+WpNIKIfnbKlIGBcWXyHFT4oqj8mCsAm8hAA4sz1dAC2zwfBqwFnJRy
 rYWNYnFqNRf7B2zFWZg==
X-Proofpoint-ORIG-GUID: cM6tbeVbiEQk3Ba4F7MPU6aDgdESgiEe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140142
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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

Philippe,

On Fri, Aug 14, 2026 at 11:14=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> Hi,
>
> On 14/8/26 06:53, Subrahmanya Lingappa wrote:
> > Add a meson option and config probe for librpmi so RISC-V machines can
> > opt into RPMI support when the library is available. Keep the dependenc=
y
> > optional so default builds without librpmi continue to work.
> >
> > Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.=
com>
> > Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> > ---
> >   Kconfig.host                  |  3 +++
> >   meson.build                   | 14 ++++++++++++++
> >   meson_options.txt             |  2 ++
> >   scripts/meson-buildoptions.sh |  3 +++
> >   4 files changed, 22 insertions(+)
>
> Could you provide a cover letter so we can understand the changes
> with the previous versions? It is hard to figure out why we are
> at v8 and what we have to review again.
>
I was incrementally fixing issues and sending out versions.

This mail with subject line has the change logs from previous few
versions, you might have missed;
 as it was with all the previous versions' cover letters.
"[PATCH v8 00/10] riscv: add initial RPMI virt support"

Please let me know if you'd like it to list change log from all the
previous versions instead.

Thanks,
subbu

> Thanks,
>
> Phil.

