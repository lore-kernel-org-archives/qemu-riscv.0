Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D6BCD5BD5
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 May 2026 18:52:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wSfq3-0005be-Kq; Thu, 28 May 2026 14:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSfp9-0005Qt-It
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 14:51:30 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wSfp1-0003h2-A0
 for qemu-riscv@nongnu.org; Thu, 28 May 2026 14:51:15 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64SHPcGj3203245
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 18:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Bqks5si4g3GXmg0Ng2sm0SeHDK9Z61vdMKamg1Dgc2s=; b=PvydP0fysBisCDep
 M/54YU4/1SC2CpIgvsRNdjxPYIixJ7bHmXbxh6RWYR7+Uut52AYRApmvq8v0/ZWU
 eiHJDAyG1J0eQC1cuFSz5rnrQkITo2H9RtqbjrLYGubjYBsuFHywZh0740IlUYxQ
 xQpTQg1J0L993ARL3JmDH+I9U5RmEqoOFFU0jAp9qkY8qRGvCiG4o2p6DNYvADoy
 lN5RPL50mPvE2d5SODJOWeVBgDGBszAjf5KjzO7JQnR9/FakKT4fXZvivuygGV4T
 QLLy+uClFq4LS0TxqgglIh/tT4Wzs5XPa90Yf9iz2LBo3foOol9KvdeZ19/97VQR
 oMR+Gw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynm9cv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 18:51:07 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-304950e5901so2557362eec.0
 for <qemu-riscv@nongnu.org>; Thu, 28 May 2026 11:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779994267; x=1780599067; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bqks5si4g3GXmg0Ng2sm0SeHDK9Z61vdMKamg1Dgc2s=;
 b=SvTmhv4sL03nUkXsoArPOhEeAeT2/zEEo+5c8FLQZey4AyzCMCuQf3Z8b2ew2aSLxd
 PRtkeKiTZYMgNIMAxtdgcCqxExxu9em95aSjfI3rhhpOVulFcB1u2jQ57i+3+LvGBIX+
 9w4MlJbi9Fe+L0amajyTRPw83kLmtbOl3XVksi0D00fpNVvfXOOFSM1dxuvCvLPeqPe7
 g/m6kTS972luswKd2531UezNeL+gCBzE/2ltVMKymyPb2a9Me8eq1CHu/OvseYXF6OT6
 5fLm0+/W8d4rL9m1UGbW+7kg1c23YZYXtxf6A0g8Y7agTZB0iC+7RcfHiN7PY7j9s2Ys
 TDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779994267; x=1780599067;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bqks5si4g3GXmg0Ng2sm0SeHDK9Z61vdMKamg1Dgc2s=;
 b=LBcGKnE8k1D/oKAtXQe3YVA65GllhYu8FRMEVxWkmaJQK6NSeBra99uV3PkExy7Frf
 FfAz7mOfw73eKdiDY01QdcUHpm0kYvQ0d3Opg9E7IqrAaKYIfY20Bb5SGEs96B51PD15
 jkzmx+De9UKaXP+VsmYyhDC9FEg2l5M6gYiVMTvqSU4szciHYbbi6Mrco33LTVoXOEMP
 pyz/Rgp2BjgxDB4I/TLs/G44HhhKXRooLxbFadg0nYcjzvYA6GFRQvjikBufAH/XBd/U
 9fekCO8yCkl5xsEEYzzWhpwwsN90vsyb2wAmQjMMNs3jhJA5xHFLU3aCL6eVHbmKMpjZ
 e1Ng==
X-Forwarded-Encrypted: i=1;
 AFNElJ+o20FCxhOdLUPZca8ARlyCJeabyxJ4Er7wyYHUETCbwS/Ozqa81X8Dr5w7M1fRfQjiTvt/UdSHaqmy@nongnu.org
X-Gm-Message-State: AOJu0Yzp+0Py7LFFueExXjI4AGJwGKLjc2r5lUrq2tXodsvRi0KL2DPJ
 bkGk+uFrOTZ7SDe0nGWlghrazaCIG0Mrgu7BM1MhpjN4ViJWrefYBY/jLhT3TdONM3sWrpDXiZn
 LnS4yDjffIFYraygNE+uwyIjgEzLXcw+WrPbpcwA7gNWfXOGy/9z8OrfVtg==
X-Gm-Gg: Acq92OHAJSGnJVHVLbGV+vs19KbIPRGvh9AHb1A4L++GDS4fLhrVGvyUr881YisNIFP
 YYtKIoiDQ/VTZ3N4qkegbKqFpCwb+kKV8isTTGN1jkOzWbvkJtCXS12A8RxDRQ6dmAVsHATYGZK
 /V9uKNC/hPvl5JpIR2yAtt4byt1BKTZU6+rR6dr5IxhxC8UbbdweOIob96scfGMpDs1QXinyefj
 /JK3oOTcwECRrc7PycBZUH2WebFNTGFDgpevAXeF+HTwDCGguOymEbwL+moqAjj99zNMa2QoM0B
 Z8HQtOYR1/p3uPtwV6p0ckqgaZr9JMhzLVAohpK3sr1mUCY6CAowiL4N14GoymKbmLSvRdq6r2V
 UO2JOlMP47JSpHgABkwD/x9YC6ADS2w+frxo1fLVDUHcK2VV09q2Qd1qjajdIMphkm0d6/QfcRM
 Qm4XS5vp/CMT/ShveXxOys3+1r
X-Received: by 2002:a05:7300:a888:b0:2ed:e16:6b39 with SMTP id
 5a478bee46e88-304dd3b8a1bmr1215560eec.17.1779994267315; 
 Thu, 28 May 2026 11:51:07 -0700 (PDT)
X-Received: by 2002:a05:7300:a888:b0:2ed:e16:6b39 with SMTP id
 5a478bee46e88-304dd3b8a1bmr1215534eec.17.1779994266745; 
 Thu, 28 May 2026 11:51:06 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304e9715fbfsm64895eec.10.2026.05.28.11.51.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 11:51:06 -0700 (PDT)
Message-ID: <5f55a2b5-d126-4759-93a9-557a97d038af@oss.qualcomm.com>
Date: Thu, 28 May 2026 11:51:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] accel/accel-target.c: move compilation to every
 target meson.build
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 Helge Deller <deller@gmx.de>, Michael Rolnik <mrolnik@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Glenn Miles <milesg@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>, Alex Williamson <alex@shazbot.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Jason Wang <jasowang@redhat.com>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Xu <peterx@redhat.com>, Pedro Barbuda <pbarbuda@microsoft.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Fabiano Rosas <farosas@suse.de>
References: <20260528051642.115721-1-pierrick.bouvier@oss.qualcomm.com>
 <20260528051642.115721-4-pierrick.bouvier@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260528051642.115721-4-pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE4OSBTYWx0ZWRfX21T75eZOTjs/
 FV62BW1T2Mucm1EcyfUhndixPC0kCyEeK+0MrMPenwvW+xn+QM9eTRV66oDSxL2swcAVXLbVfX5
 wNtC7H24BJACLjLRC81eXlhilyVsw0957rSK+MPwkbSsYY04QnlEnKzXFbv1T2znQXhNOJb651U
 QZQdZ2fV5GA0M+0M2am+/ZwXUkg2qH5zoi8cznO4YwVsgdNVQQx9DfMw+1ccbXvvv+be6yihLWD
 OZS2WQO+3fChAINjiEyNCVPWIgf1E8S5w7ZBnmEe+xzaKrS10cj47FJRImyc43SIEbgdZZqyLQM
 b/QRzyQ6ftPO8/yAs71D7BE5WiY907tbTbV2Iy5CbrOrn28hw4cqokEgsxcNv2XJzDZl0kV+E3n
 mmPlretO+yQ/42s6riw8St1GTIl+/lg3sKbZHi7YScm2Xpwv3rHUQ6c5HcbLmRwmyQr5AcTZEyI
 dqPNCWTSzzp7u5FbygQ==
X-Proofpoint-ORIG-GUID: MtfwFkJDo_OyJnltGcPiGqIT2wpKWZ3v
X-Proofpoint-GUID: MtfwFkJDo_OyJnltGcPiGqIT2wpKWZ3v
X-Authority-Analysis: v=2.4 cv=EdL4hvmC c=1 sm=1 tr=0 ts=6a188e9c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UtqSAlyDIoC1vP3DVQYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280189
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
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

On 5/27/2026 10:16 PM, Pierrick Bouvier wrote:
> This file defines TYPE_ACCEL_CPU, which is accel-${CPU_RESOLVING_TYPE}.
> 
> This type is used to define cpu accelerators, and accel/accel-common.c
> relies on naming convention to find matching cpus to apply a given
> accelerator.
> 
> Since variants of a given architecture share the same base
> CPU_RESOLVING_TYPE (arm and aarch64 both use TYPE_ARM_CPU), the
> TYPE_ACCEL_CPU gets registered twice in a single-binary.
> 
> Thus, for the single binary, we need to register TYPE_ACCEL_CPU only
> once per base architecture. As a first step, we simply move compilation
> to each target/*/meson.build, without solving duplication yet.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> ---
>  accel/meson.build             | 3 ++-
>  target/alpha/meson.build      | 4 +++-
>  target/arm/meson.build        | 2 ++
>  target/avr/meson.build        | 4 +++-
>  target/hexagon/meson.build    | 1 +
>  target/hppa/meson.build       | 4 +++-
>  target/i386/meson.build       | 4 +++-
>  target/loongarch/meson.build  | 4 +++-
>  target/m68k/meson.build       | 4 +++-
>  target/microblaze/meson.build | 4 +++-
>  target/mips/meson.build       | 4 +++-
>  target/or1k/meson.build       | 4 +++-
>  target/ppc/meson.build        | 4 +++-
>  target/riscv/meson.build      | 4 +++-
>  target/rx/meson.build         | 4 +++-
>  target/s390x/meson.build      | 4 +++-
>  target/sh4/meson.build        | 4 +++-
>  target/sparc/meson.build      | 4 +++-
>  target/tricore/meson.build    | 4 +++-
>  target/xtensa/meson.build     | 4 +++-
>  20 files changed, 56 insertions(+), 18 deletions(-)
> 

This patch (and 4) will be replaced by:
https://lore.kernel.org/qemu-devel/5b693f87-2f9a-4564-9efb-83c815bcb20e@oss.qualcomm.com/T/#m5c3e717dcacbbf013c9b4255248a3b5daac5a2ea

Regards,
Pierrick

