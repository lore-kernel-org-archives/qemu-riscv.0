Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10855606A31A
	for <qemu-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 19:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PovsFuz9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kamAJRwh
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJFEc-0004mY-Q8; Tue, 20 Oct 2026 15:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xJFEO-0004hf-8B
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 15:10:41 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xJFEM-0006dF-FJ
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 15:10:39 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69KI77nJ2385044
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 19:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ktxyaH7DNIkud1mcxP3wvB9yisQeqxyQelx7tbu0Y7w=; b=PovsFuz9PaFo5gRm
 bZb2vs0D9t/92GODieD4JZeZzGRpG1uLIvahUWZaPS2M69NH41sX6QLt2S6/bfNd
 r+mtKSGW96XPN46KDmjJYKh/XaO9a7XRYFghap2rFUL/OuYzevPcRVK9ys2vmARd
 xC+IhQjfGqT/rjrRs6XTk0xnLx869FqFwpwch4hiJK/03Je16jFm5H9FmDYRL6hd
 yNcohT+GzHkTgX4O8IQFJch5ebB03UH+WEj9CGyMC1nZpAy2U/2d/3X5WS+CQAbQ
 l/LdZjnCpgrHJQBVr4ywJzn0pplQNDwIT4caerMPfbo+m+p6IA/z8lJyXoBBNng6
 q/JIvQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n44b3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 19:10:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-33c35f5ca6cso7172889eec.1
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 12:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792523434; x=1793128234; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ktxyaH7DNIkud1mcxP3wvB9yisQeqxyQelx7tbu0Y7w=;
 b=kamAJRwhYDSyeNZjjgED7zORJXVOYGWdv7AXeBoyQvEpZ1bpb7yznhbHBMlK2KbeDg
 bFiQUssfCRkTyIuzm5XONvwUZ43hy4w/+uiqvmCPGxz0vP0o35j5PkvOWevJyJXKHNw+
 b+merU1/A6XNCYk1a1ESAY8Odj0DSTjBuhwVao5PJqXEnir5A2Ybn0Zv5RU1vPbKyut3
 ddOB5otqzQT9FhsxFiNt2WSHc7Bh5zcRbcwGzTF+16chfH3zsc4ndd2uL6GaPWMV/8p1
 f20DKSgDN05koLT+sMikWxX/G9K7psYhAXwLJCBtslxrw0EllNg+V18rbBCZua1pcO6G
 ulWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792523434; x=1793128234;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ktxyaH7DNIkud1mcxP3wvB9yisQeqxyQelx7tbu0Y7w=;
 b=ihs9TN/vP7iDOKtqxxYVWSs6fWIoay8Sip0ZuS7z+IOvUFV3nAnrGkqgM0x174iPAw
 y2fCZ8m6ouynffGXXyOiBaxjeFOKRVfg72CafD+0mk2fkhmoKxbK/xORwPr0D+fB3Jwg
 TTzO3ZmpIi7MLIWTWBph4FFLt6B5c6X51JoeK2bAqFtPE81PbyxI2aeQa88InOxiUJ6h
 cQX0Jaw1lj8te9RxxXpQiiEBDjpqrwAlgw2pNPtEqADV6WHFI+twCzLZEB1hSxm/0xCi
 ug2Ip5M8waYt+tswoRzqCopuzxWT0Jg7aaDQISu0qKxlLknCuf2lfWxWTpEj8XM0GVBf
 /Yrw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzBfmLvV3mG6Z4ddzfKmgr9u+E7CQIIGvJwHvoVXoyd6pi4bkCa7EGCZ8DK+Ow6XiI9koVx3k6XrZW8@nongnu.org
X-Gm-Message-State: AFq9FYKrSS0OZ8zhHeaV0ChoNeosmFucFISjXYG2BayFfdbQICdHxeUw
 zBrMryPDXDmxinJIQY3Z+/1Xwyygc5acXYu8lytmTqW+FCXOZN+7hFOloW3RIohevhXGOfcECXU
 vFx7PTG4tTspu+d820iAdbaMx5H/9iG+TnKY0cfSlJX/qOzhMWCTXdA7kVg==
X-Gm-Gg: AYBFou2deM6syj02Vj+/PMBeD+FWlGu018oELjsSbBpN/pU1Sxo9TPWreBCMeozzLda
 OLaw1/u2men9aDuzOhdP+v4TXepB/Wqxbbme1scEwxmNRc21TEs98QW4fZyVY888SRp5SRoR+iT
 FRwKQfDJTA/LtPXPz3bN9y8tkoIK5/2xXtAe3sCvsaLktBhRst9Zy7JDz2zTXVSkwd5yyPqXm6+
 scu0AOlbG1L8jA5PGqxCXaV4J/GARA7dIfPIgrpx6SyChziCVitWPu5kVnindzIQ4hM2VsyiIOc
 eIXcC2lhMYeaZRVA/FBoT9M4IVGp68dhb0ksJ8iik+siFybF51Yk/3ScJ1T/Ygcc6At1qZHvn6o
 mmMvCmSqYkYIgAOhul7g39djILgNUKD0rVVwlB6FxqsS2WP+WcFq5CZxcxt5C9aztGp9ROw==
X-Received: by 2002:a05:701b:450f:10b0:185:33ab:4d55 with SMTP id
 a92af1059eb24-18533ab4e84mr15803612c88.29.1792523433911; 
 Tue, 20 Oct 2026 12:10:33 -0700 (PDT)
X-Received: by 2002:a05:701b:450f:10b0:185:33ab:4d55 with SMTP id
 a92af1059eb24-18533ab4e84mr15803583c88.29.1792523433225; 
 Tue, 20 Oct 2026 12:10:33 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1903d87ab1bsm602543c88.21.2026.10.20.12.10.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2026 12:10:32 -0700 (PDT)
Message-ID: <116ac62b-3bb8-4dc1-a136-4452a1c1946d@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 12:10:31 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/27] target/riscv: Register CPUClass::exception_name()
 handler
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org
References: <20261007094516.75732-1-philmd@oss.qualcomm.com>
 <20261007094516.75732-18-philmd@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261007094516.75732-18-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: d7bgTIbt7hfRN0KSg6Odd28Q3ODF0UQq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA3NiBTYWx0ZWRfXzl4m9Cl0Go7r
 LIXJ8IiEIM8UB3M4Ul7Uv/h2IGvL4WEFGepS8mFwmVaytI3GAQVc2ZFhZ+JzsDwxZukocRinJv5
 Er/z6p1W03kIUvY4FXDmZ2YTGBJIwcs=
X-Proofpoint-ORIG-GUID: d7bgTIbt7hfRN0KSg6Odd28Q3ODF0UQq
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad7bcab cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=tTG0r3Upy50XSGkOqccA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA3NiBTYWx0ZWRfX7jpz7fkrScxg
 CVRP8/84IYXuyT/Lt8hcWejs7SLlHxRsx9hbghgwvQQNcBIeqq4JqK6XDsKk7HyJimbXRU2G7MQ
 PhB/OFEuquKaca6SleUnsEnKyQHIymZ+865MeF1uBzRMP9U3TWIC9I1ERarY3i12u++EwxuLObK
 FmuHW4B0q9fqxYO9RlAGqau7wrx65Z0OW/hEp4kxZoXhF5qqWj4gKYErppM1krZM4129WTcWsmG
 Bth2NOLDeUPRUd9bNlmcFgvQ/0yLg/fnouPAKF57ooeaEcEFgj5Q0Gfzdod+WZNnGzAmzHM4LNn
 1UYlFEcTTk7cX5LWTP6xrPsyuLOkAREQVwST67cRjRHpG1TyyEZkGLFmaypgT/+Vr2t2KDn2COm
 6FRPCMVWLkWLIj9ipKq9UR93f7dBsuFiLsUJzoYnolaiOjgJFiY8PID53uKZC5iKzfVF8tsQ/nZ
 PFl9Q98pwNlBlHFeRug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200076
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/7/2026 2:45 AM, Philippe Mathieu-Daudé wrote:
> Factor riscv_excp_name() and riscv_intr_name() out of
> riscv_cpu_get_trap_name(). Register riscv_excp_name()
> as the CPUClass::exception_name() handler, so the common
> exception logging can resolve RISCV exception codes to names.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>  target/riscv/cpu.h           |  1 +
>  target/riscv/cpu.c           | 29 ++++++++++++++++++-----------
>  target/riscv/tcg/op_helper.c |  2 +-
>  3 files changed, 20 insertions(+), 12 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

