Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17029C5B572
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 10:13:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvuLO-0006ZS-0D; Mon, 17 Aug 2026 06:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wvuLI-0006Yu-AJ
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 06:13:20 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wvuLG-0004at-Ad
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 06:13:20 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67H9dn1S1058608
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 10:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qGLH8lZmQRn2gHViVJmyCdYIQSMzFwTKzZI1GtGJPbs=; b=nvBTKEgAFyxl/aeX
 Vcn0tYVBgySjBoZWdbF1vSm30358MR8iObBqnSMHyC6RGeLLfDxLxjcDEoxENniW
 E9T9cCNpEJbTUD2zzkuayV6SXpl7NHFit8pDBtzfLyyMwGgIZIh3/TJ5ieHZaWvN
 QvynnntK7UR4YxUwIn6wmECO23zfdXn+wTc4K2YxYDVzLdecyWis2T0Qc63RHKWB
 WidY0GJNOSSSreCI720sJtpyG85Fq+9zNkPb3drythSusqnnm0oY0GAEEFFW9vrJ
 dnbj026kf+nM5dxu5RmSnE6aSogn4QSLuwOVcXSUJ6ljEbcqJEnnhC2aZz7A1V7U
 knMrBA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3x30gju1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 10:13:14 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-5c3f89239f1so31334e0c.3
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 03:13:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786961593; cv=none;
 d=google.com; s=arc-20260327;
 b=JX8a+74SDaTflPehi9SJaj9ETfSai22nI0xeQD3eSpjyGbIShAMHPWhJFYYvt2xeRK
 FP1zXbYl1KDuXWvgLmdjDV8tHniEzyjXWC3tAbFaxtMXkoe9JnQgLERPMbcK2w+HrUiz
 /HdLmamsP4XqsNlTi72Yc6tnO7NZv5r9yPPpKbv93T1s3PJtCs3hyA3Pd490YbJWcjgV
 U+KFx/kedGtiaLV5Yy4MsUWeHbKRgGv2HTf/FMmgMQ2Jks3j4+dtCQDXEMC1wp+KipbJ
 +kaNWukn0KvblkFhTjrC4yEboKPGQOSzUzO9bwYSeL/8/0kTN6iCzJjMxVwjKW4KpKNX
 Zdkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=qGLH8lZmQRn2gHViVJmyCdYIQSMzFwTKzZI1GtGJPbs=;
 fh=+jnJZRWdG55DF5qo9EVaIvQDN1LKFt2TLd1wdyE9BhM=;
 b=Lm3JGTv8W/IIHjajYlrzqVtEE0NZaUNUu1HRRaw9h80sxecqC2cRRPXcMcKCSivFQW
 wLhWO9ByAKy2mHI13cEGRoiV4hn4zMWQoqbcazJGu7cVQeiRHsdnnVQpfj9/x0THohHR
 0g44WMlWu6dBLq34Y3h7fOuYNA5fjUaEz2WErX6lAzAS4mZjtjK+fDvdczF9aWJL1ySi
 p6DBU/loXiN9kiQIqJVq1W0rho+wb30D2SXRm44XrpLsfk7lSKTILEQvA6qzlRch3JpG
 MBRpcN88pbFtBAoE1HsAh+q1RNcdB7M1CFgTWnmYXkNiQugx6GXFD8udc8N+4JyTUmTO
 b0CQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786961593; x=1787566393; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=qGLH8lZmQRn2gHViVJmyCdYIQSMzFwTKzZI1GtGJPbs=;
 b=YvwGCxyvfH6myzcBUwT/Nto9E+qHL7Pe5dWZINSbuVkolVYP4Am08ozdCsicuHxczv
 bonDB+6D0pCCp8T8+kdJ5yVsZK6UFXfs1Jd8RrbyGig1fr9d8THgJfOrfV0epyNYdMZb
 sFbpW0aZ5Gc0UJwEzErAKT93kX+OlV0xXyL3Y8YXReYbxz0ROuIQJv19JIqRaobnDl8D
 b2vig+p7ve1oNW9GYKk3x7Hq1jkyqSOt8Q0yHmSd+nnc3jvsPbfpGWYIL3U2jZ4jHFuT
 R+BX6rFA3wCCvVgZaBsJcGBH8vraQX6TgRvl5JgrGBeZBvgJdjIKH/6GSOpliSrSE3ek
 9Weg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786961593; x=1787566393;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=qGLH8lZmQRn2gHViVJmyCdYIQSMzFwTKzZI1GtGJPbs=;
 b=Wh+Gb51745wnMPVg5FBveClrNCwcaDVOWLe2bKMNnehlt1iTO+vejUIg0hlV+Vmfca
 eKTlBf1MfwMLcIT4Yo3ugO++PX/wG26s7AUx4S4vCRJ+n/svZa6087PiArV8OpCNDtpi
 mQ2VgsIOSmWHkuUh1SvF34s2ozoXIGD4iWtqmsjj9gjiPCdMTz38ec0vFKZQoRIQy0am
 zfX2CWOAVDXcCG2UFbZ9R/bsj05JLyvDcD3PYMp/rc9dwFUNK22yu8uU11RHAF4sTh3y
 NMMkesL1qkGg2gmiGFjNRWN9xRj/OeXgdykBekh+kdy2hOdR9Pvp80ssSVZt4TZPsKuo
 4kUw==
X-Gm-Message-State: AOJu0Yx9QQjHpcFmqbyd1X3bVaLFZCVS8LEEZH/6zsFmmH+zcCOZel4F
 RVgX/7t5ZpH9NBTl3Mw3JMz4oPb+pqoZcaVwHc9rNe9T2LZXj7p4LrVQICu4hA+hwfJsmyFlWaf
 6mfpcfkFUXKYEQXbjeCN8dVtOq3JjUerTJwpsakTDgX7dyG+hCzqzHNdFLzhT+Tq1RfyP+W/Oob
 S992M6oQLxKA3LiBhvurVur4f4phDO2NW+
X-Gm-Gg: AR+sD13V6KZBblmNca3LyEJhuhtjGTMxqDTs9sbucHKvNUkxnyASnIyCFc4k8uTv4CM
 8sv4c13qlK/l13ZCp1yNhC+vWeoSPgnjnoWqF3uMZ0Mfv3OHgNf7GQY73YVG5P+StjPJr8lUA+v
 vfvKpYq5Hoe38Aw6c+tpcNrw7X5M0E4mlHWzMqd1q9DbXtbjSygvnt2TBiVck=
X-Received: by 2002:a05:6123:4d6:20b0:5c5:b3c1:1fc3 with SMTP id
 71dfb90a1353d-5c5b3c153e3mr469129e0c.0.1786961593534; 
 Mon, 17 Aug 2026 03:13:13 -0700 (PDT)
X-Received: by 2002:a05:6123:4d6:20b0:5c5:b3c1:1fc3 with SMTP id
 71dfb90a1353d-5c5b3c153e3mr469125e0c.0.1786961593175; Mon, 17 Aug 2026
 03:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260814045315.3416169-1-subrahmanya.lingappa@oss.qualcomm.com>
 <20260814045315.3416169-2-subrahmanya.lingappa@oss.qualcomm.com>
 <7c5a0b1d-12db-4be2-b20c-9d132b027a76@oss.qualcomm.com>
 <CAPxK-6c5ucsJttV6WVTQSe=O3s+q-tL=-Mv42iJPUBftFAXFhA@mail.gmail.com>
 <f54d8c2f-3d30-47f5-809a-ddb60c8df03d@oss.qualcomm.com>
In-Reply-To: <f54d8c2f-3d30-47f5-809a-ddb60c8df03d@oss.qualcomm.com>
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:43:01 +0530
X-Gm-Features: AcwNN1V_ACrCG3KTU64icogQ7wJKF8dYJ8w-vEpg73BIorjvG_FHr8pRW5SinbI
Message-ID: <CAPxK-6d5YcqNSsjBkYrwxm-p5VT=nX5e3P=XjcwdZRZC7ePGhQ@mail.gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA3NSBTYWx0ZWRfX8nME9I/hViQx
 NGNI+48pWjDA7fNTWQdlqgA201LG/PEjv+P9ze+56LQ7pVrGQz+lnWf1pZeuYdnLV7W7AGv8d+4
 L7bM1ZraLKfV+pYF5Eo/Qir/0x2bhz1tU2ylxmJEU2weOPeyXqNdSw+RG6urvXWGBvHJFpuGyYn
 mMnF9JYpZry5ladSwbz+834/svovXj78H/nVUHIdecJVZ0zjzQ4hICzwvPXbpj9NE+tVsuBnjh/
 XapzOjtsPaWiiQ3A1ZdR72Ci8+KKSjvfsiLd4ZrTQdxVWAFusGTCKuyxIUWq84FUm0x7GOmlW+k
 kMdJEUIvoKifvbW02weegKJ6GPwQpFr7XBePhwCUklYoasHthmsnXNngUozfq04LwJ+IaoaaEs1
 ZNSbYf2k42fWCviXQ1YSsfL7BMTabywx3I4Bx3qEKb0Xdct1dPxuRcmC4OJofvpWzMG2knyDqHA
 AWXv4dxP1EL5fFkdrng==
X-Proofpoint-GUID: -Kpd4mvRXNsmh_c04P7Wpp2IBUmpbsVx
X-Proofpoint-ORIG-GUID: -Kpd4mvRXNsmh_c04P7Wpp2IBUmpbsVx
X-Authority-Analysis: v=2.4 cv=Y9/IdBeN c=1 sm=1 tr=0 ts=6a82deba cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=gC699ZJ_JV_s38HN3AEA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA3NSBTYWx0ZWRfXwHKHdBE0+AnO
 6GUvPN10jujZDldNrYfU1oe6WJFf0bDytHh7ZRuTn7/GIt6CPFY0VgnviL5olfGAVySb6qGdWsQ
 7IBZftrA5qB3EHPhBoREA+rM1kK+DyQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170075
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Aug 17, 2026 at 9:31=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 14/8/26 20:34, Subrahmanya Lingappa wrote:
> > Philippe,
> >
> > On Fri, Aug 14, 2026 at 11:14=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
> > <philmd@oss.qualcomm.com> wrote:
> >>
> >> Hi,
> >>
> >> On 14/8/26 06:53, Subrahmanya Lingappa wrote:
> >>> Add a meson option and config probe for librpmi so RISC-V machines ca=
n
> >>> opt into RPMI support when the library is available. Keep the depende=
ncy
> >>> optional so default builds without librpmi continue to work.
> >>>
> >>> Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcom=
m.com>
> >>> Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com=
>
> >>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> >>> ---
> >>>    Kconfig.host                  |  3 +++
> >>>    meson.build                   | 14 ++++++++++++++
> >>>    meson_options.txt             |  2 ++
> >>>    scripts/meson-buildoptions.sh |  3 +++
> >>>    4 files changed, 22 insertions(+)
> >>
> >> Could you provide a cover letter so we can understand the changes
> >> with the previous versions? It is hard to figure out why we are
> >> at v8 and what we have to review again.
> >>
> > I was incrementally fixing issues and sending out versions.
> >
> > This mail with subject line has the change logs from previous few
> > versions, you might have missed;
> >   as it was with all the previous versions' cover letters.
> > "[PATCH v8 00/10] riscv: add initial RPMI virt support"
>
> Apparently neither the mailing list nor myself received it:
> https://lore.kernel.org/qemu-devel/7c5a0b1d-12db-4be2-b20c-9d132b027a76@o=
ss.qualcomm.com/
>
> But indeed it is on the riscv@ list...
> https://lore.kernel.org/qemu-devel/20260814045315.3416169-1-subrahmanya.l=
ingappa@oss.qualcomm.com/
> >
> > Please let me know if you'd like it to list change log from all the
> > previous versions instead.
>
> You could have proactively done it directly, saving time to all
> readers ;) Not needed anymore, I'll import it from riscv@, thanks.

My bad, I'll keep that in mind for the following versions.

Thanks,
subbu

