Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FC3C79F82
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 13:47:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x2UFz-0007E8-W5; Fri, 04 Sep 2026 09:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x2UFn-000752-PE
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 09:46:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x2UFk-0004uT-J4
 for qemu-riscv@nongnu.org; Fri, 04 Sep 2026 09:46:51 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 684Dgqno3743303
 for <qemu-riscv@nongnu.org>; Fri, 4 Sep 2026 13:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +fEbR9zaPKax8zv8Jm5IjpRMtmNMM2LgsfcWUzneQ7U=; b=XIOCe2gjiQ+MGJqU
 efb/ECsKA919MxdtgpnY1MO5i2eE1iuZWjeGZpSLv2LSwm2O/wne6xA3XJocO0eK
 kEOGog0NcfuczjciSvIw/EAuXgLbjQy6BXVhRFxIG+nXHVexmZQDBq/P6ZGVPU10
 gnNvS0/BLQZB0XxyYEVYTADmOtR6DzKa3oaBfQWGwe2qCktwgmbRD3SzaNtyGI1y
 /w7fv3ImACwnjXoe+e1Dgrqj1sNUW5k2D/6a+DxEbLSM70TmFUep4SzgWQ1NNKsL
 dHccyb93xN+83phB1brS57+zQnSgx1PuVNZsAW8m+E45jJNwnY1lQ8tsOqKho1wJ
 U021AA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyxkvba-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 04 Sep 2026 13:46:46 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-97e9e2deaa4so851466241.1
 for <qemu-riscv@nongnu.org>; Fri, 04 Sep 2026 06:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788529605; x=1789134405; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=+fEbR9zaPKax8zv8Jm5IjpRMtmNMM2LgsfcWUzneQ7U=;
 b=Nqh4LYCEMU6DcinULr6092acZb18T/a1sFcdtPn5HCqi30f+a8KdjdBTUgWsqyEE3N
 T8PEkXQtGn1qjcgWlOEneXVSdpWo4VMl++MSQRhlpoBQ3z542eaQslo7wrZrqQXNX9Ad
 JK1r8wfdqXxmDdYcqD0Y4nj6G4yfA1voY4wjHsNIplRf9ZL3SoxhtmgcIc7RQRD0sa/j
 ItcVrS8vDuSOBb8sjeANRsBRWbZXXq4tkKLc1cpCGSi1UZKa+u9lEhTF0PYJscfjwHXl
 ABe7VMmWYOZgWRmBEYBT8bFKX+4oJxy+tBCANnrX1bKdrZckYPrlXUIdpqEdUKK+XzTx
 ugkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788529605; x=1789134405;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=+fEbR9zaPKax8zv8Jm5IjpRMtmNMM2LgsfcWUzneQ7U=;
 b=dZHoE/YDD9I0NjVvaDYs2qdLLTFp42Z32hfsy5v66+xFc1RTo3hDTKErEe0IvW2c2M
 0x97iQVhbFiV48DgTFJ8OdTbqLGKdaa+gYM/UwxF5cEswazkbFPGC/YPYdq4Nayne/Z1
 Ecdr1ZBHRMJsG8iklIGHYUlWBz0Mz+KBvsQQ5VQ71ZqtqUQAorcsRrNOFUF1j4/Mx5uW
 RlaYCGebll9HkjGCLujG5oxypNA/ZTdxKgUD6zGv5lzY1eKeWNnuEqHgU1Qm0YEmuG80
 cRjYyZReZNSRtb+83TeftVgq41dS7dS7JuDr1IpKXuuDqPCNIQQLEXyqYrJgJgQTjynQ
 zADA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwM6f6DzaUewgGM8cGca2IMQoliPa5slgUvI2yA+iWCc5fNsLZVcqVVzCjhU1/gOGoM891PGdNbRIKc@nongnu.org
X-Gm-Message-State: AFuF++liCI2tA1ZqvozYYl8mcsIdBhDsV7BCIr4VBx4KShHnh3jdXy62
 UTwV4XYokKiJXJ/lOfNCaIbksWr7Dot1XN6s8Pco1z/7gsd/efNsdawyQRtT8zR7tJmFB+g0hSU
 M2efOI2d1DqVFjl32FwvJKXT0YXTVWNN3lS+kv6epp8BjCi5zCNBxFnm9IQ==
X-Gm-Gg: AYBFou1oMivz1vXfnSezYZHrUJ6kuwSLy2DOeGdn9KkyxrYTwJaWlF3Rbg+XBpXjEbl
 BbIjK1pJ1AMLgYbmHLMJHj4bHDw3dlJqvdr/TvV4ByhmC57sRP6WCAmybiQPH3jyupnR2F/CssE
 ihNNRF2ipf8xy9/My/rkE+pbIwELUI9V//HK9RzWjaHDxdrP9aE8GtvEww4ALZnrY5jQP2G/Ec0
 5NXRXLog1ga55V4OZg7xXeEidgzuTpEyz6up8jVWBr2OLes/hr4kkBJzJAl5Msc2OgeasM47rgR
 mNk6/VLM4LgoLCErmeZx7C9qk8VUoRY0DKc3oVWHk4s26sJQJ1hsGP+ebgRydgPJ0yY5/Fc4UWV
 B2qDTu9RNefSfH2KRFxgdoH9IQQdpybbBZA==
X-Received: by 2002:a05:6102:578e:b0:778:4fe0:8297 with SMTP id
 ada2fe7eead31-78a4aa70e09mr2626832137.11.1788529605389; 
 Fri, 04 Sep 2026 06:46:45 -0700 (PDT)
X-Received: by 2002:a05:6102:578e:b0:778:4fe0:8297 with SMTP id
 ada2fe7eead31-78a4aa70e09mr2626808137.11.1788529604930; 
 Fri, 04 Sep 2026 06:46:44 -0700 (PDT)
Received: from [192.168.69.202] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf7739b7asm67821715e9.13.2026.09.04.06.46.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2026 06:46:43 -0700 (PDT)
Message-ID: <18f4fdf4-1e8a-449f-a003-3bff20499a29@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 15:46:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 000/105] move check-tcg into the meson build
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 qemu-riscv <qemu-riscv@nongnu.org>
References: <20260904124604.2207440-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260904124604.2207440-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lZgV9S2Lc-SNlduHvdtRyRuADk-E8oo8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDEyNCBTYWx0ZWRfX6NQMmXk4f9ph
 G1jINTM3HNq1q3J8v+y46ci0EyNFfCwZ6I+Dbf53Q+eMNYOfmS71r7nviNSbbw6y2PcG3BT3Swu
 ju7eBzW8/LUibuPl4HKJW0kF72EDF1E=
X-Proofpoint-GUID: lZgV9S2Lc-SNlduHvdtRyRuADk-E8oo8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDEyNCBTYWx0ZWRfXymRApAVuut55
 fqgzRd6kkyNx4Lu3lC/EBIX+94kk/o9znLdF2kNkx995aXPwg7qNfIqQPEASp0w5FrJUGxTV2lK
 LMa836eMkREhhfyO9ef/bqywRHrXD2JK0p5NCHus1Z8sVYMGfiTVsrR3qo4F/KvnWDl26udkoDB
 cRqxyH7/GcqLq5UM5LIMe5T3KPNHwIyR3sHiKK7O3mUIvaKmuZ14hjK3xDrn9K0ri69uJBrd0OV
 z8w7WIxXz7ncIDqoGWZ0NwFbu40UAXuSRmTdInYssyHTWSzf+Ni5owg2GPtUumQsJcfv1TWTLbw
 XmJaDK6rwIiUG2UPQfpyQUWCsZp7jiG74XUC/0LqbTDEb950BCbsLa71gjvbiXG2eQWi5r1SOwF
 V+Vdc/1z5JaV7LCdl6GC5Wr+uWG76GKiw9hPvwE1AhoVR2PdF0y1eCav2/wSM9fZHTTXZt7V04O
 FVPJXOKkeYWcFVSK8ZQ==
X-Authority-Analysis: v=2.4 cv=X9Zi7mTe c=1 sm=1 tr=0 ts=6a9acbc6 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=tlVk9iiHDizseOvCDaAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040124
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 4/9/26 14:44, Alex BennÃ©e wrote:
> The following changes since commit 99e54ab5e7a6efc945af6d5661842155d1f3fc7a:
> 
>    Merge tag 'hw-misc-20260903' of https://github.com/philmd/qemu into staging (2026-09-03 16:43:24 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/stsquad/qemu.git tags/pull-11.1-check-tcg-meson-040926-1
> 
> for you to fetch changes up to 26395b536c3ec0a857dffd6548d8ef49479dedad:
> 
>    MAINTAINERS: add maintainer for tcg/tests meson infrastructure (2026-09-04 11:38:01 +0100)
> 
> ----------------------------------------------------------------
> tests/tcg: conversion to meson
> 
>    - remove unused variable from multiarch/memory
>    - standardise checking plugin output
>    - bump minimal meson to 1.6.0
>    - introduce meson plumbing for check-tcg
>    - return error code if docker probe fails
>    - add CI/self/mem test to gdbstub prot-none tests
>    - use raw opcode for fprcvt test in arm
>    - remove unused variables from gpc-test
>    - teach probe-gdb-support about mips
>    - identify or1k pc register
>    - port check-tcg logic to meson (all targets)
>    - update documentation
>    - add Pierrick as a maintainer for tests/tcg
> 
> ----------------------------------------------------------------
> Pierrick Bouvier (105):

>        tests/tcg/riscv64: add float reference files
>        tests/tcg/riscv64: user tests
>        tests/tcg/riscv64: system tests

Some of these likely need to be updated for the latest RISCV merge:

$ git diff --stat 99e54ab5e7a..d2843fbf802 tests/ | fgrep Makefile
  tests/tcg/riscv64/Makefile.softmmu-target |  14 ++++

$ git log --oneline 99e54ab5e7a..d2843fbf802 
tests/tcg/riscv64/Makefile.softmmu-target
883a4d4da4d target/riscv: preserve vl on element-zero fault
bbdccc84fc3 tests/tcg/riscv64: Add tests for rv128 [ms]status

(not sure if this can be done on top although)

