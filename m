Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654F1C79F82
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 07:35:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3qMG-0002Gn-Kd; Tue, 08 Sep 2026 03:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1x3qMF-0002GR-N2
 for qemu-riscv@nongnu.org; Tue, 08 Sep 2026 03:35:07 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1x3qME-0000KI-4Z
 for qemu-riscv@nongnu.org; Tue, 08 Sep 2026 03:35:07 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6886Lc1v3299140
 for <qemu-riscv@nongnu.org>; Tue, 8 Sep 2026 07:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=ApVK2K6CK+SDMLvCTUfJLG00IBBZ+ndDHv1jcOYX8sk=; b=Z0
 cj6FuHgXyy42eFWYz4bqn7GEqDdiiTXQnOWME0ic11OMdnOeUOfb5wZke+CAqaLR
 TDC2GAu9v1rkL1Cp0TYbmd2r5dGloBKASXsYOllNmFWUBVa8DS3UhyudL4HscjcP
 FvCVYydz60I6e05ELI/xpK+EGvMlHZkzY4JyggxABtCNNe6NeWYXjt9bdFB6/H32
 IZ9Ho569jkbiuQEvVrm/CxC0iamYalUaBF+jltlGgp3Qf7+TcbQoTLVSI9xjGUNY
 4XtVhQu8t2gEeCvHNpSl64WKEB3cUf3mroinz7nipmRVnXrAIWaYweeFbev2S3t7
 RWR3GojiE7FExtvN4KGA==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjb0p8rfw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 08 Sep 2026 07:35:04 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id
 956f58d0204a3-66e509682ccso5565631d50.3
 for <qemu-riscv@nongnu.org>; Tue, 08 Sep 2026 00:35:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788852904; cv=none;
 d=google.com; s=arc-20260327;
 b=Mpuub5nIJgCwva8/Ve0IZiSRTa/wlYbMg5OT0tDDcG9f/ZZwA4QpIZAfSj2kWM0qq5
 dleKGUr/7J9ZQovV8KeEaDbdIecP41iMmejKyfjEhso5GRb29A6hBNI2xLbX4ed2cp5Z
 hI9Cy97/DmIE2KE8p7pQ1n0+UbbYRZ9Yc8wNMEIAegclw/HEMwieSSUxlDE6lLOf+VKp
 U6dJXzFvzrD30vMJ3i/7BnuZ6VUJ56X7Yanguf4EEMgaD3IZR/hCuBPWmgwIs0Dytaso
 AXNStAlnJGm129E3eAOBeyAFNcoF0AQekAnzoSlAkIvaDqRfrvPqoUKn17V0cwZ7Fx0f
 rEFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=ApVK2K6CK+SDMLvCTUfJLG00IBBZ+ndDHv1jcOYX8sk=;
 fh=+P52MnXWkcjU1T0ZB4RHpJMkHX+rAVF4IHldF74r0Do=;
 b=bYPXfhj8MbCUQ74dcmBk8hHykWHPy01wFSBbd0Xa3zG5gGb/RugNwP6U/q2TWYziqG
 EVm/QVpUEbvjuYXOL4Thd5cnN4qbMApLn8DsDSZssdas8lAFvlC/LFW3rL2pJIrdWWbY
 TI5p5xKjpUOOvQud76iPTsrmcxOln5Ti+QAs0qOTThH2lfzdFfpqMPEvC/vwaMmMuzAM
 kq1AFlzbNXU3ZLh0aV/XASl2AUA3wY1iQbndM2gZ45Kv2f9LMRkiHYdYrNaxLL7RvdYd
 F3omcMd6iyk/1Ic/xp3Az6ffPSMNEeaaekWNvKET7u2/RRKitOx1EP7aEl+VQiJF2Nb4
 ijjw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788852904; x=1789457704; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ApVK2K6CK+SDMLvCTUfJLG00IBBZ+ndDHv1jcOYX8sk=;
 b=Sob9f9mn6HDpbKG/NEOn521BWc/qBgL5RAgoga+HjD6KRj0Y7AHshewtEY8HZldJqw
 C+zPWyAh0SK1KyDQpDGpulBQwbjA8wTOl2X2jpKbCTquECJASUojCOeGSQDgkLgnfyBf
 10PRUMDYiZtiOWHPX0yEE5kwoB2OuEA4cmViFeCCTqW9Jsvz6WQ8uzAd75eQh0V6Rvbj
 ySyAVC3JHZ/fqEEUsGBus/3abWFNCbRy1MUftZH3jqVfsMZYUpQlQ1UGv/1Yf3OVxGFI
 ydhg27NCcEfduPgCTMm3VKGlTXrAOcnIoBZddepHrnVueDqQJKSVmmKMrQ7sqtHRlSBq
 VnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788852904; x=1789457704;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ApVK2K6CK+SDMLvCTUfJLG00IBBZ+ndDHv1jcOYX8sk=;
 b=R2+cUGB7g0FxKMEKgLkQ3MOiIvHwy6PjiLh2qM4aHkZQ7Io2aIhL+jR13SqN/8zhsZ
 lSIR+xSRnUlkneL/KMFGdxBrCNI8bXgcvq4GYMAaOdTIx4+GPMOVbrYxZo9EIdABK6mo
 crEsm9nfoIULI5BXsgv5AyGSRsrdSWpijtBu4Giuj0K384xP9CiKFrb37l7FNmMLa+aP
 Qx5wVBA5KfdeHFaDc1jN5hMbD1nmv1kRVzQg+3Vp7HH8W/2/DDbMcgim9m18kNsz79d4
 0Dftg+CDZfzLcHwlal0AJgXVxxqPDysTg+9SOFJJ4dOWds+8aKCtWvT1fIxqO8UL0Yzi
 vDKA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxV/biVB5XKqnxhW3ih9SjP/cRy0HKmVcHa9Fp0go5+bohDkqY1wyzZz8g8/b07exY/gd7wUARy47dG@nongnu.org
X-Gm-Message-State: AFuF++kpp6IWRC8SV38LcFQILm+Cod/mYKnfkD/l6H3AJtDi7kyvu8lw
 uJ1FbfJA7QEGKqERF14VMf1vchuMTXATzRVrHisf2jzfMeqH6dmTEtqcyyAGR6dkswnnmOZkc/g
 NxMmotnt4VAytNII8aAsTYl4iKQdCv69tRpZsnYE+GytL2xG0IeIJt/msh0QYwIaiPWfV7Vta/6
 P+/u9P/rvgpdRzkv73QUOlPrK9JY+4Qxpw
X-Gm-Gg: AYBFou2+6eyNgs8nX86S/mRFXKo2tNo3IMYoS/X5q8rTzzqPLVvLOjhltcYJSIhoEQW
 MvTrqi6IKaVxAqlFon2VqZzdXuqCEzqDcL0FoJ2fAfV4+tY09vVc1syI4rDiR+XGvlyhOtjOeNr
 2b2ONTwGaYBKS5IqRsoyk/r2bsm9BDxyHeYK5Am9isUHBK0oAEmDi9zptkM4k=
X-Received: by 2002:a05:690e:d88:b0:66e:51e0:f6a4 with SMTP id
 956f58d0204a3-66fc1be6e2bmr6563035d50.42.1788852903699; 
 Tue, 08 Sep 2026 00:35:03 -0700 (PDT)
X-Received: by 2002:a05:690e:d88:b0:66e:51e0:f6a4 with SMTP id
 956f58d0204a3-66fc1be6e2bmr6563027d50.42.1788852903201; Tue, 08 Sep 2026
 00:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260904195610.964829-1-daniel.barboza@oss.qualcomm.com>
 <20260904195610.964829-5-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260904195610.964829-5-daniel.barboza@oss.qualcomm.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 13:04:52 +0530
X-Gm-Features: AcwNN1Xkaokp33i3BNbjSLIGhNWxOGSoEpBXtV08Fk-jM1dydhYceZHYhOr6FgI
Message-ID: <CAB19ukGG7=FUWbuBj8fnYEz8d3ze6gg-yVCccdO0Dj-Zg77HuQ@mail.gmail.com>
Subject: Re: [PATCH v10 4/5] tests/functional/riscv64: add riscv-server-ref
 tests
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, andrew.jones@oss.qualcomm.com,
 leif.lindholm@oss.qualcomm.com, Chao Liu <chao.liu.zevorn@gmail.com>,
 Nutty Liu <nutty.liu@hotmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: f6pmKWafd8vsu5maN_Buz8w3gZxXENiB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NiBTYWx0ZWRfX83DOpPgISf+t
 o8c4YMawS/Lblju3MnhW1r/OTlzpDJFCXsSLeX7YBspr6ngv/ErZHTlP5A1p6c5ZQsjghlWgNse
 Hksw7jauu4taRU7YvccSD6PdobeAo88=
X-Authority-Analysis: v=2.4 cv=HL3z0Itv c=1 sm=1 tr=0 ts=6a9fbaa8 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=69EAbJreAAAA:8
 a=JF9118EUAAAA:8 a=vQIqPbW8F-S7p7p2BZUA:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-GUID: f6pmKWafd8vsu5maN_Buz8w3gZxXENiB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NiBTYWx0ZWRfX33h6GVshLvdO
 SnvPoDMuC1O6hcmgOLHnWhO6fPpNUKzN4D7b58eTpeNZr1vetRgc6E+1CApUEXRutjaLfwWstR5
 l3WV7+hVd5E+sFLTSfgKJ3o7rxdEZWwoUUOmuL3WB21r6lZCsXSOl8enbla0fV+FYBO+2SGk0RR
 ViR8BPtjKVyU5G6ud3fdgU92ZE1+uPSl0h7lxmE1+i57nsloQl0SwYcKeueZM1ld8Y0BiDdChge
 XQDj2V7xUsrWpNlvu1UlBCq4GVXj7ed/0F/R36kzQrM8W+SsEZOzIF/F9iZEbkuhvvsKS1cAHIu
 F2RBzaRnPVKkgLZ+vkT1UVhqqXF+HhvKO+gI3ahFwmx+v/JdF8srI6MUdt6SoBHGE6hBcSEwouF
 dBKrWCbSl9+Eh1RllJ08BwCyC/4bUHhjcwSqdSiFmyRoRCfxRHst5sCHvxSprkBGNBJO9U5vVMJ
 zePeZ+1MKDNYl98rb6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080076
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=sunil.laxminarasimha@oss.qualcomm.com;
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
Reply-To: sunilvl@oss.qualcomm.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Sat, Sep 5, 2026 at 1:27=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Add tests for the recently added riscv-server-ref machine:
>
> - a new test_opensbi.py test.  The idea is to have a quick test that can
> catch trivial regressions that would prevent OpenSBI to finish;
> - a new Linux boot "thorough" test that will boot the machine up to the
> buildroot prompt.
> - a TPM specific selftest for the riscv-server-ref board.  The test
> will be skipped if there's no 'swtpm' in the host.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  tests/functional/riscv64/meson.build        |  2 +
>  tests/functional/riscv64/test_opensbi.py    |  4 +
>  tests/functional/riscv64/test_server_ref.py | 88 +++++++++++++++++++++
>  3 files changed, 94 insertions(+)
>  create mode 100755 tests/functional/riscv64/test_server_ref.py
>
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>

