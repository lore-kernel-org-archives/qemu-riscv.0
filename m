Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F16C5DF6A
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 13:52:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvEo7-0003s1-1e; Sat, 15 Aug 2026 09:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvEo1-0003j6-I1
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 09:52:15 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvEny-0002SZ-Ly
 for qemu-riscv@nongnu.org; Sat, 15 Aug 2026 09:52:12 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67FDMZsN219370
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 13:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1JWImf+Dhv9RqeqR9XP+j0RUd7qOflO4VcouI/KZrK4=; b=cbInQVMMAUgMhWKz
 iTsnU43F1ROKkPfCcswmSZYpB1+J3W54Kn1UEDs7x6iFWBUSgHhZNHWX5N2tEbsD
 LSIZ41ear+HOvA1U2i9ujNUqd7MDZkB8JruzkMvDeQjuC6CrKjvOmduLlPTz/9sv
 f54M4X/PPoPrylI6HV9Xe93BgnVCmUIr3JOdCJSvY/RbmApqJKHOxk++glzY7vzA
 6eCpHNb82yUKna6K5kwpPECctIfuK2krWe0D/sjXkBRCx9gnmT4ZxBHLDfg6Cuat
 lvKmLYNJx3l+Sm19LYr4gxF/I4nNZMlnPxe1EJrujpwKWQwmmXUeq0ih1j0gbLxJ
 G6QvSA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2hd7rxrr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 13:52:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-934979ee9f1so252742985a.2
 for <qemu-riscv@nongnu.org>; Sat, 15 Aug 2026 06:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786801925; x=1787406725; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=1JWImf+Dhv9RqeqR9XP+j0RUd7qOflO4VcouI/KZrK4=;
 b=bVuOWzYYxzLqi4sTISEzhZVdMA4g9rVLcKdzEwg7y0VWU6MY8yCiatnmcMRSs/Ymid
 74yPwOnXUwcrsvKCk+MvLePZXUFi55MbdznyvhZm2yKQzvMeNBspiorhYqfpBlbUfEuB
 RkWzbnaOmQc91ba4bjNq7024OsHAWOQR/gFu+q0D1N5PHLtciwcJ+mQwMltp4Hiit3CX
 0pzoMEAkYwaMdGw6juLmBUZ1wGPmUITB9trvzO9utYMYk3otRbD/IDzChJaRureY1Rs3
 M9k2ajIK5HvBhtoASsIPSUy4ecFP6FkQkaD1pdhP/GRFVevFGyavC+O0pQ4mqP14kp8i
 4p1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786801925; x=1787406725;
 h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1JWImf+Dhv9RqeqR9XP+j0RUd7qOflO4VcouI/KZrK4=;
 b=mFZC1gCJyoFhAC/PJS7hjzWoJLh0h6L/AX8GWAJOoOhWwcmArmFQhkMgfejgsqWCFR
 WvVSkmlIFFsRkmDNsYv3XLCrr3pqWpIX3R3BIT7Linh632EHEQAf1Dx0qXELNQvSkyBq
 st0Vp240IrK9I5qq1+LfQ4JYTpyxrIG3zWRXeGMolnSHXZKbDASfnobr9KJNn1iu9ld9
 dflP+rVSxECZ0REjruz/bpemdDZIgQAdyq8Lt/e5SP8ggODuUgBG/rLODjul0BNqjtRH
 bW+/tGzuRA5DHZiasYv/qQUeVRrVXuohfrKzijwQCzqyUGuJENKFQWMGFIx7d3EolHDt
 dUsw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrE0qrTGfJ+T7l8I1QcIvif5KNSgiQDq/LtKGTHuYbC9SGGRtiYMl2UNcLMJER/YK1ak7V6OVPfLiom@nongnu.org
X-Gm-Message-State: AOJu0YxM6pNlQiJu6KQqTIob26/lrGEx6X94UEPTS9ir/qmaCiukLkAR
 aXtE0sXWiVIGBBZBWDMUwoIkrd212tHCzXO+9sLwa3OeFlTA2MqNr5bWiN7V9u0yhIphjDxfQT5
 vtJnqJ7NUe7Xu4jVJtJOAbBfL2ZTUmeA7kv6vyCrquMbyaHcUxZ6/9Qv6jA==
X-Gm-Gg: AR+sD10ItmJ0RlArcBEtYR3RlY83QFkHD4JvbcivxiHr5JHphlwZuN/8ECr1cK/LGJ1
 WmkDhHvRIKRLRgrueCAy1nW5IF/AWzkNees4G1m54p0qPhfa3ocLkCXKQlPbytFeVdSbqHnhc3u
 YCLFi2j/G2x8vO69Sqh3rqYLY1xPn+/Oc1EfaSgLIW+zQP141Az05SEAZJLUUiqcl7Ri1qFQK1S
 ZBa92ryFPwZTBHcDaAvEa/bukjbBwpHEWLGxxvKiTqyCGyTKI1oy8s6hu4NQjpL/OkKkeyd1hwk
 tTExMh2WxF8nb7lQMlBE1aiIvOzwPp0GNMhni/BfJjSD+QZP2/ZeCp7/K9sB6ELUQ3lWSxlYChm
 S5ETkhQ61or2dvcwPLhtq7uaRIraZqMPy+Qo=
X-Received: by 2002:a05:620a:2889:b0:92e:7cc9:a888 with SMTP id
 af79cd13be357-936d1fd98c4mr1390221785a.2.1786801924818; 
 Sat, 15 Aug 2026 06:52:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2889:b0:92e:7cc9:a888 with SMTP id
 af79cd13be357-936d1fd98c4mr1390217385a.2.1786801924391; 
 Sat, 15 Aug 2026 06:52:04 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f219f7bsm16844631f8f.13.2026.08.15.06.52.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Aug 2026 06:52:03 -0700 (PDT)
Message-ID: <f5beef33-4e39-4458-8d2d-33663de77849@oss.qualcomm.com>
Date: Sat, 15 Aug 2026 15:52:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] hw/cpu: Slightly sanitize CPU API
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org, kvm@vger.kernel.org,
 qemu-riscv@nongnu.org
References: <20260811183410.22428-1-philmd@oss.qualcomm.com>
In-Reply-To: <20260811183410.22428-1-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDEwMCBTYWx0ZWRfX4UIneCa8GBdO
 R+aCzuC837LeyY5xBbDWakLw4ycz4tVAoSPCcKMkeKmnLWHtRXe4jGc/D12vazsOl777SMFEAwI
 ZQ8xCgxE9ueaCQHXhME0vViqJu0TCmuO5y0vhfMjCzon9nlPbDpFDYQ4T6nGJDckveVh4hQnNii
 ojw206ar0YCatrBhwMBCkRNXD3Ko/RTB7kqB+B6LWxhNRbvJ0CQVSCaHdSzljNO6sfbuWdn9YyW
 bruiL+83Ymj7Dr5H9uFKOVoYRrO8q9FSqFUfdCJ0ZlkvhtFBe5Qi+8w/jYEhMac3gslSmEmzMv0
 HzNYx5F7ftDVF83aQdVV423IO3oI16/k9sizfzBA4HUIvVulk2D1hxWktpjoJ8MYKBHKFHN2uga
 VKENtnK5TcjgbZyi8JgcNDETCvxG+Hx0GfsLrUSZELAwBMTrr2INueFAot0dy7peAsYd1+bCl1I
 996fY/osrK/JqaO0i2A==
X-Proofpoint-GUID: nwIHErtBXepjbFVE0zf_lvjGmNfIwY-X
X-Authority-Analysis: v=2.4 cv=Ja2Ma0KV c=1 sm=1 tr=0 ts=6a806f05 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Ql7IHVpF8h-uniIvIrkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: nwIHErtBXepjbFVE0zf_lvjGmNfIwY-X
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDEwMCBTYWx0ZWRfX0pHK8Vi6ro/9
 OFRyRElAerP9g3HXVgh6BShdhmrWKhIi+fWuzsLYr1XtA9nhKjJscDNyolRKo52FMxQ0sk8kfYe
 lxsfFvKkcP2bEmKznmEae07DJQFlK6w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150100
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

On 11/8/26 20:34, Philippe Mathieu-DaudÃ© wrote:
> API cleanups, mostly removing system-specific code out of
> cpu-common.c. Code churn renaming functions, in the hope
> to make things a bit simpler to understand.
> 
> Small patch set extracted from a series clarifying CPU /
> accel synchronization, itself a preliminary work to introduce
> split acceleration, eventually.
> 
> Philippe Mathieu-Daudé (8):
>    hw/cpu: Correct CPU_GET_CLASS() comment
>    hw/cpu: Include missing 'qemu/accel.h' header
>    hw/cpu: Move internal declarations to new 'cpu-internal.h' header
>    hw/cpu: Rename cpu_common_realizefn() -> cpu_exec_realize()
>    hw/cpu: Rename cpu_exec_realizefn() -> cpu_common_realize()
>    hw/cpu: Rename cpu_exec_unrealizefn() -> cpu_common_unrealize()
>    hw/cpu: Extract cpu_exec_realize() out of cpu_common_realizefn()
>    hw/cpu: Move system-specific cpu_exec_realize() to cpu-system.c

Series queued.

