Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7678C5DF94
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 09:33:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wyR2U-0000Vn-59; Mon, 24 Aug 2026 05:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyR2S-0000UL-3q
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 05:32:20 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wyR2P-0002EP-VE
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 05:32:19 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O99ANY2448696
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 09:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WTUCGB8srnvftuNtUwhIDahYXSeShayU5BpzvmeWeYU=; b=OEFQlFBh55RX61dJ
 mb+bxTdkg9xRhSfWTd6DPHGYKAPjWZqKqQlnjSb7H78w8HDC6OuZsO3O86KRaToZ
 t1sopQT/c3tbloqphgyMp1cNmUBTQJGoPqP9C9+0IK3tZlXvcLi35ucO8z2IMbtm
 Yfhix3frH7qOJg+9NEIst0+P1w4v0UuNhB0pKKnnxxcqRaEXxbxuH4WWEiJAib/a
 woXZsTtkvEBkRlE7xxil6MUEyB1r3EOFN5RLyUmMj9jiwdZLqyYeKH+uZ04/x0uJ
 80Jr9MuaTxO7Jo8/CAZLiaBxc8s1L4gVJU0HIqZuuKovWcf7HmL4SxduppMKXNMl
 9Z+MVg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8j7r0dyx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 09:32:08 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-74ac10b9862so244714137.1
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 02:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787563928; x=1788168728; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=WTUCGB8srnvftuNtUwhIDahYXSeShayU5BpzvmeWeYU=;
 b=cDQNdqjXD/rTS2rH6Vcdu1ptHIOVj/g5JJWSrllz1p8ld8UMvVdubwaxP6j5/YV7ap
 tOsT5y0T6Pm2WEXcSNS43hY/fXfrmD2orwJrYt4grHxdZgJyJPrwmOk0jzjvqEb6D4xJ
 SoQXFJI/b3LCe0j9CxRHNydm2A/bHCKxiWiL55c5CqyYRw7KII0BiqouJW9JPZJKHM48
 P44vwZTOt0LK2o2WdWvQv5uAyo0+iq/8n5fPsttYlbyclyC8mh15xAbCFzhfEr/iwuGl
 M8Jn+dG3sycN50l4/L1tVPWJr0s/FZIJoy4duMGofgd3V/zKhzlZZgB1x4i5K7fVqfr/
 SNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787563928; x=1788168728;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WTUCGB8srnvftuNtUwhIDahYXSeShayU5BpzvmeWeYU=;
 b=cTPa6YEYisXdTTgWWHp5gghteKz9AftihrHl8bfVIYG2HAwX4rjnFKOUtMXtLU/4FO
 2QZ10O2WkTtp58j+e98mK4AbMheki91AVxxWTAx24pIrsM3i4xj5Q6ZrFPgJjv/lNK0R
 94xJm48ye+nltk0cHgUXkQX0JXPrWd7/xPi1LbnRTWwZfgELN77fEUAHS45KeZ39t+2e
 sUpDpmB7RV/fN9o+Vd2smaZYbDv9XrnUnm2WGHYabzpkvy9tee0+O8ztb8Y/Z/ZbbuxE
 afLNBaHPXn+moA0O1n3IKJVvapZSlRqOklu/NizO485wwfsx3xGKK3qpn3oeGb/6C6r8
 tX4g==
X-Forwarded-Encrypted: i=1;
 AHgh+RqySlNhfsCLBFkmATSftdkoplN70XXpqhr2x8nLj/PTJp03XeEAE2hDDpby+njQhouigaOZUAaM+pNC@nongnu.org
X-Gm-Message-State: AFuF++nE0zvuuRksau8kqhrZ6kj/BSgltn0YqiTvfhpkC4dPEekhG4KS
 j/thH9gfJJfiMpf4q/HqL4pclRIHlvBdaP+mgQQoUyMOR3JizOJAFe9e7p/IfDMQZJUveMRIDjr
 TT/jPfUIp1E7QbTKgGhm3Qxu5jvoKhQKSguc9hsjWpMyvc+MS04skDnurUw==
X-Gm-Gg: AR+sD12DZlx4ZNITpPYxpV/kQBXi0Dw6dN2UeNnos/3MYLi59RPzUY2RdbnZi7c7P+Q
 4ZL6FAyORQqwtWkyJWjQS8LpO2wnJJp3Jf31Hvo+RERYvBfj5xR77bFTYU45/Khv5yknhzMHExX
 OZBxooB8lS+lMa6BMP/7Rt7ZaOSpg3PnmiHjeAiEDEDGb71bSY/0phX4MeTjAWxwzwe4NaQmQ27
 1P5uCzbZlhUtic6CBDvtxC2LZDGXCFNd+zmQPytUNB4CkkYdGoTStpB4oTqRBdxg8iJnDdsQieu
 pIa8qT5N5tuP0kQwD5p27jtRMAMa8yLkrtAJfrXpEj0zL0rIyKnwbj+tCbK0Y0gM8nfRG8RIyB0
 zdQwMLZV7GykB4aT9L3MZI+cu+Noa0dU8psvCGg6yAA==
X-Received: by 2002:a67:ef45:0:b0:77b:4894:4c8a with SMTP id
 ada2fe7eead31-77b48946049mr4209540137.8.1787563927694; 
 Mon, 24 Aug 2026 02:32:07 -0700 (PDT)
X-Received: by 2002:a67:ef45:0:b0:77b:4894:4c8a with SMTP id
 ada2fe7eead31-77b48946049mr4209525137.8.1787563927290; 
 Mon, 24 Aug 2026 02:32:07 -0700 (PDT)
Received: from [10.254.188.74] (44.170.88.92.rev.sfr.net. [92.88.170.44])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a59e02a8fbsm11046272a12.13.2026.08.24.02.32.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2026 02:32:06 -0700 (PDT)
Message-ID: <cf22f809-e95e-46a8-86d0-a0250ae06710@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:32:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/15] cpus: Add const-qualified CPU environment
 accessors
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Eric Blake <eblake@redhat.com>
References: <20260821104950.32108-1-philmd@oss.qualcomm.com>
 <20260821104950.32108-3-philmd@oss.qualcomm.com>
 <3c9fe944-2b51-412c-bd30-26bf013cff46@oss.qualcomm.com>
 <22188776-edeb-44e6-b79d-0b877292221d@oss.qualcomm.com>
 <bde71c0c-ba94-4bd6-9ef9-e868fbd8562e@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <bde71c0c-ba94-4bd6-9ef9-e868fbd8562e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4MyBTYWx0ZWRfXwqq3LbsMQN6c
 VJMFD0o47+U2zCOruhaJ3Ssxw07XQ62GNd1GKjMcLgEWYiQXanswIAh509W1MK1o/SrKoc6d9LB
 Dkt29N4a3P38jw4f4yWkolBP1Yp0KTlFcQkBQQ31z/sdnKeLUjBYjO0uK3JoxhRQqRPzBfYK4NP
 zFa1zCaeHU0lWUoVUMuiG8rLbOl1WULV4aY4hR3imus/krHXvebVFhCUHHlgAK4Xj4GqL9oOJ49
 pmOnU5mHOyxA60X7EL6CJQ6SAB+ctfRW7DELKMXm+QAw1VbTX6NOu9cHb38r6HupDNvHuGUZwiM
 9Kdfnjxra7Gh7A/jE5TSUfT6c7Mk5PSmJZH6pijCCh571jF7T1cW3P2GRXIQfqQ9VVf6h0yybzO
 3HRUmEtN+kdPRAkUfhxHOM3gfQ0uvMThkhZ72NUDPQ/Edx1QcyJOaVePud9Qmh28btlMJLLCObR
 lOCIEIBTKTq1QUHf/oQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4MyBTYWx0ZWRfXwGbZcL90qBfF
 RCukmE5py59bozIlBB7+WeRRtRooUDlp1VbQY+RIsl9v5c/YwWNMOb5No4Mg/SjMdCt1EKvioQ3
 F8PDIlTbmrYY7USfHksEFOedblrgImM=
X-Proofpoint-GUID: Gf21cOzzomPED0hbPf1jDxVCnXCMFQkh
X-Authority-Analysis: v=2.4 cv=IL8yzAvG c=1 sm=1 tr=0 ts=6a8c0f98 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=s1NLoHz9uzatdv2VNqxUSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=ZokkgsmZNnwAS1iu5ZEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: Gf21cOzzomPED0hbPf1jDxVCnXCMFQkh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240083
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 21/8/26 19:07, Richard Henderson wrote:
> On 8/21/26 08:51, Philippe Mathieu-Daudé wrote:
>> No, this now fails distinctly on Ubuntu 24.04:
>>
>> In file included from ../accel/tcg/tcg-runtime.c:26:
>> ../accel/tcg/tcg-runtime.c: In function ‘helper_exit_atomic’:
>> /home/runner/work/qemu/qemu/include/exec/cpu-common.h:100:31: error: 
>> expected expression before ‘typeof’
>>    100 | #define env_cpu(env) _Generic(typeof(*env), \
>>        |                               ^~~~~~
>> ../accel/tcg/tcg-runtime.c:135:26: note: in expansion of macro ‘env_cpu’
>>    135 |     cpu_loop_exit_atomic(env_cpu(env), GETPC());
>>        |                          ^~~~~~~
> 
> Yeah, this of course fails because _Generic wants an expression and 
> typeof() is a type not an expression.
> 
> However, in this case less is more -- just don't dereference env:
> 
> #define env_cpu(env) _Generic(env, \
>              CPUArchState *: \
>                  (CPUState *)((void *)(env) - sizeof(CPUState)), \
>              const CPUArchState *: \
>                  (const CPUState *)((const void *)(env) - 
> sizeof(CPUState)))

Indeed :) The simpler the better. Thanks for the help!
> 
> etc.  It's only top-level qualifiers that are stripped (so const int -> 
> const), but qualified pointers aren't top level (so const int * and int 
> * do not match).
> 
> 
> r~
> 


