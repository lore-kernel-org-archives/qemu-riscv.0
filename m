Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04C9CD98D8
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 12:45:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXenC-0004cS-QX; Thu, 11 Jun 2026 08:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXemz-0004Yk-A5
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 08:45:50 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXemx-0000mS-J2
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 08:45:41 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65BCSmSX617034
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 12:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9bHiMKFjKb1LKmtVMXu/kITMmbYgKgqrhMZ/ChTKtO0=; b=H9xC12kJB3dPeCol
 7Ep6YIHPY8jj3eC+FrovtfB8GSvautFZhTSXxk3oGP3vIQk7dXMx8/+433vevlqJ
 5kQ/EOei+XZ9ZJu6DP5UbI1npmD+Qla2Hmp5B0WtwDCAP+t/Ofp3HZHnQU1espbl
 mZJn3y5MLGQCSxsllie5omaIdHQV4zH1UV8kkdmW4UUYpPE+o/xHMBxP6SWwnM/I
 1D5QCwdtYHI408hhNwtqXnO8pYDRpb9fs6kcVWf/QbA9YAPVuo08ZYVpMXVVVhMH
 22u31Bwr98coTDnctDqcXzayCZ4V5VfIbH1ymfTnZ81bc/TkOBzkfOEqiebFPJkE
 Thpuyg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6tkevf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 12:45:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-517c65e497eso39914721cf.2
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 05:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781181937; x=1781786737; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9bHiMKFjKb1LKmtVMXu/kITMmbYgKgqrhMZ/ChTKtO0=;
 b=ePYVrdB7Lm1EWiwVorwvFfUldMi+JcpfjZboGFinwiE8AmUIfTWj6+k/ProvDl0GLg
 AGw9pkryHb93A0kMgB1JDIKMPZ1qEpMuRf/8euFYad+FMvM8VJ7qAVLZJ34N3BKFlvnH
 Tkahg5U5rEDvp1TgBu5jaq2LLtLMFfTgFKvLNKIQtw2Ou3WC2yB4R1SR0W1F8ywzq6LZ
 xq8jlxYX5DUSNb4iHgN+9YriHvoDGVW4q3d7UYN4gD0bqYuIicZ4ZT8fSH991ExpJxLy
 JM8/u8tDjWnmd3adE4l5xjcYSizRu8h+212Bf/vDq6q8AGXc9EGL5Y1rp09kePwrDIEM
 cI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781181937; x=1781786737;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9bHiMKFjKb1LKmtVMXu/kITMmbYgKgqrhMZ/ChTKtO0=;
 b=UUqv6fIkeKalnzGaVVbxv0FjKps67aGIWf2Csz6BPEgQnQ/zySTcDZFvbraJcP+1fB
 oKbRtNNC0Tyyc3cU1qcyE/ku8SNpqGHCfkGgq1NZoz/116m9TSWp5f7sqoUMK6IuHcaU
 Mmk1TdSCsgJx3WK3ePbDRc/wF8rFt7GjocgzRDrffba6r77W/SYd8qDlKbxgWCGWWoSd
 rMBrvv9VNyw8K18DXE6tGSrNStvRNTyk9AWUgc7pY49DsN5g/AoKep94ChYMs3BDeyJd
 vSqqi+i0Wg0QZKRS+9NQASHFbVeF/mcYQG0d8uC1OfdKr/eeJIVGvPzykPJmZvcMyrlt
 OFgg==
X-Gm-Message-State: AOJu0Yz+StRvWlX4ccjrd1Lc4RO7e8J+NP1xZ9XflAGStj8oMbZ66pEF
 kJermp6QG8yciyNRtUhRdG2Jp2XXGJl9a/yJnMpAd7t2ULZFVLbXTe0He/k+c15tseOKZysD+TH
 eQd5FduCddOx5F3ISvHfqhbsMPcZkWtOSPr9jbLtl5NOXImHxSqoO7MsMDw==
X-Gm-Gg: Acq92OF3bBowXsOLc2t7h1z4CKJJnYLn9ysGXy+9nOHxms+k2CuJoSqc+8gPN4QZwyO
 LZQms5kMKo5bQLC886niJ7RHIDYOxrX25FUTSM0VaA+bh7Ci5NTjTW8qulsOHo4g1zdr49YewNe
 +i1SM+m+FmcD0RksG5YWRIMgJGuRQJiTGazvFU/wa3Hs8jhlgBwg5JnzDLrWsb5aQFj2j4M/78a
 XPDDvll+pxZS/duneZRC3CT10N51IIoySjTh7XwAN9ZGdNA3lnWLKKPeTcLAuJYOBeozFCwp6bb
 TNlAKvZmsMDrDrZB9ilt/W4UN/Rkw/40UEQhNBoojZdFvgaQPGoci4+anpvxwkC2xXCYiUTirRw
 ZB3bm/ZfNxXKWMT1CzifHCD2UYoR7ilZJwhwvn0mzptgNEk141dfsI3n6SDE1NFyJ7RiaZQl6vH
 +3b817VYM=
X-Received: by 2002:ac8:5ac9:0:b0:517:2a27:bc84 with SMTP id
 d75a77b69052e-517ee1bf755mr39528141cf.35.1781181936535; 
 Thu, 11 Jun 2026 05:45:36 -0700 (PDT)
X-Received: by 2002:ac8:5ac9:0:b0:517:2a27:bc84 with SMTP id
 d75a77b69052e-517ee1bf755mr39525421cf.35.1781181934314; 
 Thu, 11 Jun 2026 05:45:34 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bfcb0f15621sm60383666b.13.2026.06.11.05.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 05:45:33 -0700 (PDT)
Message-ID: <a3be798d-4645-4b7e-986e-a42690e3f460@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 14:45:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] target/riscv: dynamic alloc of debug trigger arrays
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20260611123412.2135600-1-daniel.barboza@oss.qualcomm.com>
 <20260611123412.2135600-3-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260611123412.2135600-3-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyOCBTYWx0ZWRfX0yj7rtN1zZ7O
 q3YuqOtksIngm/NUe+rZcxhH6Cj9Dv6LwivjxmE9YBq7i+TyW1+au8vCWLdIJmCKFI2uc1zETYD
 HK8tEQ+E4zHuS/oWQp/KexEvvNKS0bi6lCImt59uza52Oszo3Q/Aa7CeIRDMJ3yymICxBxrxCN/
 SYJ8mB+t/Sqqcq/BPTRsQnE1Re1SIDpPPTU/5uFEzsDjyrV7zOx4pYQLfDqCXq+AmY13glOmnHm
 Ej0jYxJzfiGkHj+6gcpCqQWam8xHMwMtdi1bfwCQevvUBKCq2ubEIMCk+gnpTXQ2UL+N+1Aoijt
 j64eFCgfDFsi1XucCDtzlthqqNmtRzpyhpXN9jC0mJ3LMKZDViGyzxeFmdaYAP37nB+IK43OAaX
 iVDNuByNPUBaxgQO1/fdZ8GY7LUYZJrb+OkqRmSgAwCFkN8tzgyv3KE0mYLqKe+BryW5BgClraM
 uT0SKpUetICiY2WLjSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyOCBTYWx0ZWRfX3lFPBFwaBA0C
 07hX2jX2PxqWbzhpP2RXe4jJLfOkEeQtqDDZSHhT9JPTZRu/XHFbS6R/i4ZPgSQU5xPG0RaVUxP
 qGXT4tY6COrp/941pvAlomGH3MrMT/c=
X-Authority-Analysis: v=2.4 cv=AaiB2XXG c=1 sm=1 tr=0 ts=6a2aadf2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9E-04Aa4SPOfiErpu9cA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: LQaF-XAu3tbMNG_ujQwHBzuYRRy6Rkp8
X-Proofpoint-GUID: LQaF-XAu3tbMNG_ujQwHBzuYRRy6Rkp8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110128
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

On 11/6/26 14:34, Daniel Henrique Barboza wrote:
> The debug trigger facility consists of a set of arrays: tdata1-3,
> cpu_breakpoint, cpu_watchpoint and itrigger_timer.  All of them are
> static allocated with RV_MAX_TRIGGERS (2).  This means that all RISC-V
> cpus will have 2 triggers per hart.
> 
> The RISC-V Server Ref demands at least 11 triggers per hart, and several
> CPUs in the wild works with 4+ triggers.  We need more flexibility, ergo
> we need to parametrize the amount of triggers and make it configurable.
> 
> Before doing that we need to handle a situation faced in a previous
> attempt [1].  We were unable to set the tdataN array length in
> vmstate_debug, meaning that we would always migrate RV_MAX_TRIGGERS
> regardless of the actual amount of triggers in play. To fix that we need
> to change the tdata arrays from static to dynamic, allowing us to use
> VMSTATE_VARRAY_UINT32().  This also means that, in contrast with [1], we
> have the opportunity to turn all trigger arrays into dynamic allocation
> and reduce the amount of stuff being carried by CPURISCVState, or in
> other words, we can carry just what we're using instead of a static max
> value.
> 
> All the forementioned trigger facility arrays are now dynamic.  They are
> allocated and freed during realize/unrealize, and their size is
> expressed by env->num_triggers.  All relevant code is changed to use
> env->num_triggers instead of the RV_MAX_TRIGGERS to loop through each
> array.
> 
> This will make it easier for the next patch to parametrize
> env->num_triggers.
> 
> [1] https://lore.kernel.org/qemu-devel/94c772b0-5231-40e4-9cab-6ac39b9e4d45@oss.qualcomm.com/
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>   target/riscv/cpu.c     |  6 ++++++
>   target/riscv/cpu.h     | 18 +++++++++++------
>   target/riscv/csr.c     |  2 +-
>   target/riscv/debug.c   | 46 ++++++++++++++++++++++++++++++++++--------
>   target/riscv/debug.h   |  1 +
>   target/riscv/machine.c | 16 ++++++++++-----
>   6 files changed, 69 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

