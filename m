Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF803C43458
	for <qemu-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 21:56:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wiJCk-0003P2-Ek; Fri, 10 Jul 2026 17:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJCj-0003Nz-I3
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 17:56:17 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJCi-0007Rz-4j
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2026 17:56:17 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AK3beD1846329
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 21:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8iP6kt8t3bTU1N5vlzkqvhMKaOCsn7tobbCD7oudaIs=; b=C/MYQcTDTsqUh+da
 TsznlF61RrBzQqauqZTxiLHCfgqDhzSVK7Esmi6mG6gOWh0UMJmdQTBdLv0RKltJ
 S3r3M6LdNv0QYWIeDa+ua/tOa2S88ypWxoTqNhI8MCsuK5qOuF6RCyPREdTbFEht
 ogoMfYqCGyW4k7k5skMxiUWjBpYEwYhnAp1YLRtdhd0uOK6cOXgwXDSv9gqpz8Gi
 zCE+CUOvvsv1/l6zbbDDc+0FNAIMr/tXdkE1IbgXZrbwm7omd+W+WI+tU9TTBeTb
 dMgikbO0O6diXA/Kzrh0TldHtsyQJ2f+kyir5Od0FuQ4Swa2R3HIrBqQVSiTkacq
 YDyp/Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb649rkje-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 21:56:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-5174a23afcbso14061461cf.3
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2026 14:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783720574; x=1784325374; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8iP6kt8t3bTU1N5vlzkqvhMKaOCsn7tobbCD7oudaIs=;
 b=TONuJwa2VzXvhv11dZqXhuuLF+Hmy6QSlXP9B+dV52pnTU845Xekkpi38kfaf5pfHt
 raxYEs7EmnUMMYN6ktActyt1/RNTbbiRVuGAL1fC769DSRBq/NyfKE1voq+4v9QwRKmF
 PSrwyGPYxtkowzmp9KShMXtVQWOR6yXbmFv6h/tTMF/PigRUsgP0nKz7DuafSealnuj3
 JdWUVGyT1C5xf+NZ/snHFVlNEalITm1lcUYECWIqcAPULKlaOUbFDxxNUlKHDbcJTaaM
 mgPyM8//uA08ZikEWkAI2C2C/DAFBVvQb+XYn3R0irDPgqi17J1TOB4e9L5+Q9wjPwvl
 nYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783720574; x=1784325374;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8iP6kt8t3bTU1N5vlzkqvhMKaOCsn7tobbCD7oudaIs=;
 b=UOIcDWjH1Tl7iSj3ldMept4WrruWFlQQKldT7bmy4yy4E/swwVfTGiukq51um6jGC/
 75J1jmusv/d+lJ0We98YSgTNQdO5Ie+2zXgnjSh2LgJtVWBECjUZtWaYr8jBfsk1S1mM
 n4Byigf8IP3w+sAAY8d2bQu8d1FQ7nbug7DFtB+Ysk6wXqVj9mJI/4JUgH56iyaz9Pzf
 eAEk8XKlOtKRPaW0kfo90elN64MJluSmGv1UbV24rE4RWv9TV46496EExnIjosq8nSE+
 P7f+yRw0HuQacW00BcQlhp7KUcFGVFjkTHEGj0F2n5XRhAsmA4F3ca+lZTCEHfGeaVG7
 xFIA==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro5gnR3yGtKYtnNShis0U8uZ1m67eQDG2KW6wFZrQxx483s7t+BjMnChsrXL/sNpF6WguoYsTEu2FXw@nongnu.org
X-Gm-Message-State: AOJu0YzxXjU7UNJKmHhv0gsYDEf0Ol6AKX4DY0xVYg/XguPQHwHPWw4G
 OIMzZQPdjZXE3j0ca+An6sk0G41Us6rkjoTfAGcfWptNKza0cJkIiw/V4a9d2LwMCAGMzNdXBpx
 A+G31SaVX0fwBD2dpOkIRmk7DQ3aNDl8+0g9NiVbq1fPUQwwaUFaMjA08yA==
X-Gm-Gg: AfdE7cl3XMaMXMum64ibQi55VUR9bifxwgrFMvJzStud+13P5h99KcKzk2jecWeCkJ2
 Rc7l4bDK6uo/7Ez+pXYZNTgss2aowKkYHlSpIAwH2qSwyW54HDjHBob984nsHsBa+NOg66Z+gdG
 YHHe2qlxQAd2ZCN74RWAD2sGeXsQcGieelyXccIYMdZ2YUyNLZlFQRBts8iZsp2nKGmeNn/SqqZ
 P5VoljqyDR3owyfFy5zc7E+s8jXKxOTZ+JdiGjWbhgZfBa6GFIf+JiQDumnT1FlThgWwyRZBV26
 KtIgnK8XidS17QJc7EAIzwrDFkr8u5qiJl4fiJzbxKLBuFWNiLm7u3Dl8bVKJIGX+aD3yDx6HCY
 6avXLtHQXEWDaarnJXNVbkfA6+hKe+EraelWzuhJVdzvuiTIYNritdwBJ45iQOw==
X-Received: by 2002:ac8:5d08:0:b0:51c:217d:d772 with SMTP id
 d75a77b69052e-51cbf0be5d9mr8411261cf.19.1783720574631; 
 Fri, 10 Jul 2026 14:56:14 -0700 (PDT)
X-Received: by 2002:ac8:5d08:0:b0:51c:217d:d772 with SMTP id
 d75a77b69052e-51cbf0be5d9mr8411021cf.19.1783720574203; 
 Fri, 10 Jul 2026 14:56:14 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6f3b85sm270081995e9.2.2026.07.10.14.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 14:56:13 -0700 (PDT)
Message-ID: <5ebc2b12-ba8a-471f-a0f8-4ac57fa6b9a4@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 23:56:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 22/51] system: Validate flags in cpu_watchpoint_insert
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-23-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vKXLVv6GjTp3e-F7cQDDf_avbp9Ou8qp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIyMCBTYWx0ZWRfX3ukA7l0wrQ5w
 8/bccAPOmZw8mEsqnvT6oPrPBfteVv+M1PS+1UnPfRYqooLmH8jtViXWc/r9SDBk+NfzSXaZXGe
 qtIbcNJQgjiU2yApmN3CDIOG0ElPC54nhDzGrHOfeeuNVmFP1vlt0zp1R6/rmKYB/lE5fYgL/DK
 M4bfRFBGbjGahURahGcHih64QO4iFqhPd0zaKypSZwFdcDTuAnmIotOKtHy5V0t+Hk3ebF1CHU/
 /Dsj3N7zoYSPgVvWDc5ORawf5ZRIxmy6fWIzUhYpD+3rAyWbebWngUSEUTuvzExx30HQehwBTgU
 iyNBDzxjEU+WDCcWg72TxLprgFzarM/J9pE4oUjXbEeN5sHBirWNCSSaS9N/2QHvzSw7PDmdWl/
 UH0G72eAVHpid/qrZv/RDJq7o19smSanRp1w+Q7jnKOkPJ2Gx7/x3+M3FtTIGLxBbns8zZv8Lsc
 gHUx+sQuBklswIQaYxQ==
X-Proofpoint-GUID: vKXLVv6GjTp3e-F7cQDDf_avbp9Ou8qp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIyMCBTYWx0ZWRfX0MI3SGg9Sl98
 ZOtX1kxuHkEMncv8fDAYacZE8EEFbAbXN9WZc2TVecnMqLW2idELw8HTzZhzs/jEwWrZgxnL5ex
 n2h+G3q0iSyZ49nSa+lVBHpkDguqmkU=
X-Authority-Analysis: v=2.4 cv=VZfH+lp9 c=1 sm=1 tr=0 ts=6a516a7f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=YsH3jjYhZO1Zdoctmk0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100220
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

On 10/7/26 22:53, Richard Henderson wrote:
> Flags must watch reads, writes, or both.
> Flags must specify GDB or CPU but not both.
> Flags must not contain extraneous bits.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   system/watchpoint.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

