Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0F9C5DF97
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 17:07:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzH5G-0002yX-Qs; Wed, 26 Aug 2026 13:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzH5A-0002xk-0Y
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 13:06:36 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzH58-0004w4-Hc
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 13:06:35 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QGujQB1408872
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 17:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 x+vHbcCOGg9r3Oj2tQqjK4YN3769UUMamEjDLlTTcGs=; b=dlz+86z082Ls6bQd
 0EfFtqX37KoOh0cwJPBjYphtLwJPbanOY+xObYsfqx2E7pPGRufkmWbymhePmQ4n
 rYg5r39Ivx0nfOkHOMuD2DkWojJtQdOVjMDZwYiiOdcGBIP3AMG49vDB9VDFsOPZ
 R6VC4H6j51JdG2PzCtlEmI0DqjuRyQgTSAKfak5o3V42EwpezS5u1B/GEkQXKEy9
 woKbgv5RPSZnvFUuMuYSZ4NYoWmfnKoK1Vk5YAoQAeGB0XWsMRO4Sv/6Q//i2zJ5
 NC5v6ILksrW6tv9ukGIZGiTwTKAc8EtVyaUyjh4a2ysHHEsvYSb4xmtDJ0+3cBf1
 OtRmFg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9x2n1neg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 17:06:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-52ce64c41efso20055941cf.3
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 10:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787763991; x=1788368791; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=x+vHbcCOGg9r3Oj2tQqjK4YN3769UUMamEjDLlTTcGs=;
 b=Xfkihknx7IEzsI+gOicnDTCs43iqGVmyE32VgqGFPnQoyMkYDzdK/J3j9vPXl7MvPj
 X6YbJS2TnIIN6TnTKKrLVorBQTZ+1lUKr0nCRQraYxoetrf2eUwc3V4t2sWgWpsuvF51
 uBiHPCWvWEb3RRyJ4FkyC5LeqDh0+LkZ3/qbKc6yXvn0/waoBKQkbWdBgdPbwTPYTviv
 czyIAqrQiGCIMHp2+Vc5Ll0GwX7N+VWyu7IrJdkxaGjx/2604tDjQ8JiphV3aoks9zf3
 ni/FT4U8PUGyyKYGK423cOyHPDemFyX13SoJE88BkPxOK7TkfbcYavpWrAXMKG2w3+Mt
 SY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787763991; x=1788368791;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=x+vHbcCOGg9r3Oj2tQqjK4YN3769UUMamEjDLlTTcGs=;
 b=JJa77lRWqz7oRfYJLxTO+1ebmpMaXPnd/jjMXdTLZImJi09vyi3aovM135+x3r9qA/
 DSEQYxU2aI+D4bbdGI+wQOiWODTeanlIUH7L4BXB73KSMxXHpvZAeIvbfi8YjIkgI7SM
 INfqTRnriLRKEIW4lVZvrGMcslu4stxRJdd30uwrtm2qAhyrzQclSGZuzgurP4B6uJeQ
 iAcQHOxvUmRdbQYdAsA1k8xTQ/Vl/iQ3C8SyXRSiqpmBvfzpOhesVZcgS9FSd1IV6/rg
 XWkxsbX8t9F94Kh2t9PDzKZ0UgDu0KgNbVVJWCiK7+UePWMuZfx/olPYwEu0e13LkDcd
 0KBA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpQI+K0hD277inmNTMl2hS2wTcevNMcvL6ueunQhWN12JSAZftvOsqaTpjBvLqE1dJjCqbl8pe7Fc33@nongnu.org
X-Gm-Message-State: AFuF++l0FQzTWLWXvpE7NyvAol0kefO5JYhXe0CAT1hW8G2y/IlOVdOz
 tLf9eCzS1DLMQWd9XXY4kEBCCL/JgAeYd/I7ZQq24GG5kstdUGbzGlbv3aZzgo15SO16ZMr8k2E
 CTrxKxSVwTemv22zwx7sYUp0iJTyIaY7DrMmzNIiAX/PyB/91WkPfPd3WCg==
X-Gm-Gg: AR+sD11UWukDLQ0glaBsyoypOeQXS5loDptD4z8vTWnID3WWr4VG5+2z60Vtjt7yBI7
 UDOsUS7vpKMqOsAxGRq0Vdb1gGyVcoaskzZOuWQo+5VKTKXSZCeWw+Bk7KF9wVek9T04h6T5wFR
 1iLzAZEiKkWogOCqR+UTwQy5PppJpahC0ZzQELKNrO1PGHieFew1JynsRwNt2IYRFMVfKvjx+OG
 ksZNjcuqN+qa0xepFd87d6HowkCWRUG3gmo5fIsBxUwFHrHnuA5pvWYWNx/tXIwvjJtkhcioW0x
 BFu4MKrjE62/t3YEUMyvcxgONFwigGGJJ4Suk0GsklxtgbEzB+YML6hKkOl4dqfuPwS1M0ld+9Q
 MTu604hzMoZfN/9j6P3jAMA2ik98oQiFGe7IP0WE0GOdF
X-Received: by 2002:ac8:5747:0:b0:51b:e92f:ec5 with SMTP id
 d75a77b69052e-52e4222de12mr87735251cf.3.1787763991351; 
 Wed, 26 Aug 2026 10:06:31 -0700 (PDT)
X-Received: by 2002:ac8:5747:0:b0:51b:e92f:ec5 with SMTP id
 d75a77b69052e-52e4222de12mr87734351cf.3.1787763990880; 
 Wed, 26 Aug 2026 10:06:30 -0700 (PDT)
Received: from [10.254.188.74] (134.171.88.92.rev.sfr.net. [92.88.171.134])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5de8b5fd6sm5281600a12.1.2026.08.26.10.06.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 10:06:30 -0700 (PDT)
Message-ID: <a434a0e7-f603-470a-973c-c1e3334ea200@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 19:06:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/13] hw/riscv/fdt-common, virt.c: add
 create_fdt_flash()
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20260826164814.44335-1-daniel.barboza@oss.qualcomm.com>
 <20260826164814.44335-2-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260826164814.44335-2-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -klnatzbyi0pBfURZa5Saa1eN9k11XUm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0MyBTYWx0ZWRfX8hfqFHWHZau7
 5pdO619wNibJNRMobM8tflNG8K59V7hgVzWapqUbJoZCXQ+RwoXzR5mn+ngZkukBcDS2Wth2ZD1
 LBdfRVi6gL3BBT8qLY2o9+mUFxJGLmQ=
X-Proofpoint-GUID: -klnatzbyi0pBfURZa5Saa1eN9k11XUm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0MyBTYWx0ZWRfX6EnCCh0nqKcf
 J4PZYWHAZjPMNv9FyhD69R/iztZWnLW3ZfBaudXVsY5l2h2aFExamvkNvv865MFT/P7loxRib94
 VfN0U/bHFylu5x5txzmN8HQcDeHQ1JxZVgx4QVCmLhFu4UTw/UUtq0hNlsR3EsNujytWqujdSMV
 wF67pt8YseRI4W59uodFtOE30guVcxXVdMWmwSRNbrilAxNxASfnCI5Q+1pxdvynlwh4Ltx7m3t
 sDmjvjyFuUsfaMlii1lBOK+vBlj+NQ7bOddWIkD2ZG1HefQf5Ii/2gzPLudmzYkB6VYw4so/u27
 HxM/Kehbr6+wnqR8kp7yqwd2yQ++SBpA+yJsT+vaq4At7abr0/T3Pvdc3x6tox0P7JgSawemBpD
 dlvp4aFEK1EuoEwAqQUVvmoXZBm9QpH05m2HCXXwocuyyN5pQpcuPzigRYi6+hA1Nbq6489virp
 fQBuXBSBxtKj9qW/b6w==
X-Authority-Analysis: v=2.4 cv=PPQ/P/qC c=1 sm=1 tr=0 ts=6a8f1d17 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=o1isufRNksZXpKP+aqnsag==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0j8F8ELDiVD0ozaknXMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260143
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 26/8/26 18:48, Daniel Henrique Barboza wrote:
> Add a common helper to create a cfi-flash compatible flash subnode.
> 
> This change only affects the existing 'virt' board for now but it will
> be used by the future 'riscv-server-ref' board in the future.
> 
> No FDT changes intended.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>   hw/riscv/fdt-common.c         | 12 ++++++++++++
>   hw/riscv/virt.c               | 18 ++----------------
>   include/hw/riscv/fdt-common.h |  1 +
>   3 files changed, 15 insertions(+), 16 deletions(-)


> diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
> index 1729a6abc6..6e438e0278 100644
> --- a/include/hw/riscv/fdt-common.h
> +++ b/include/hw/riscv/fdt-common.h
> @@ -36,4 +36,5 @@ void create_fdt_plic(void *fdt, hwaddr addr, uint64_t size,
>                        uint32_t cells_size, uint32_t ndev_sources,
>                        bool numa_enabled, int socket);
>   void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_name);
> +void create_fdt_flash(void *fdt, hwaddr flashbase, hwaddr flashsize);

Generic comment for the whole series, if you make this API public then
please prefix with 'riscv_' to avoid name clashes when linking with
distinct targets in the future.

>   #endif


