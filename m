Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E992CCD98F2
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 14:37:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1waDrS-0006Z2-3t; Thu, 18 Jun 2026 10:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1waDrP-0006YR-6k
 for qemu-riscv@nongnu.org; Thu, 18 Jun 2026 10:36:51 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1waDrM-0008ET-Li
 for qemu-riscv@nongnu.org; Thu, 18 Jun 2026 10:36:50 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65IDtIbf1768772
 for <qemu-riscv@nongnu.org>; Thu, 18 Jun 2026 14:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oiIzWgo2ACmGpLKfLueCD8cX1zsKt1grMXbORVio9w8=; b=cSDIWSMMm9NM5V6S
 YcMn3SBWIViGsddcpHntgXFrJcmvPqjo5CX1hI5HcPOMz7fdZp7H79T+kv8C7cnB
 8gTMLpkj2ybepvO9Sgb2QUcGF/lmjJH4o9SrvR52aVJn32PxXPFGh5d/1YQtxcDM
 8F9pP4xXHdYMYH7TPFMWEeRmFGBpjS1pzVgdFqFjtT7VKd2n1ChzdJqt63jkg5ao
 mH1dQg+2Z0vVifua0gUCE7w8v6RK553qhHVWoZI4QfZcv1kDqI1on17sfDJgXVnc
 IL0xtQPU+dOJ3tHi8kRDQgjCBHf17xvhQ0u+cNTDa9yoaEXdqiFJxidHOq8X3b4Z
 YLDZ+g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1rtun1t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 18 Jun 2026 14:36:46 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-6c5794db0eeso1326616137.2
 for <qemu-riscv@nongnu.org>; Thu, 18 Jun 2026 07:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781793406; x=1782398206; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oiIzWgo2ACmGpLKfLueCD8cX1zsKt1grMXbORVio9w8=;
 b=TvPJ0tEXiUl/YrBYtnosooRBEFDs7WNyLplt7zPzJZ1FzMR864OJXCMHSoTk8RtZq2
 wGsqEeUenN7iflwTokow8Rvr2CLidcJOOhNh//gRsKS1ITOmM86s/Jfd9lP1KTy4Gy5h
 xaABLk2Ac1cb3YHPLAPw9/ihY/MogQNS9kPqt5iLhSH+ww5xkJt/E2YVTt9Uq/io/pLn
 DIU6GQXEZm51uafIf8Mnj39acrJowzB7PIsWgAoobeFfhUA0/Wy+Msjvi7v6vc7jp9J9
 ZsdCjJXXNMj5yr66TuWOl3MOasMKY8Zp5VZQzPNt+tL+HKVnAELYFuX6SqIOxg67OSOR
 KGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781793406; x=1782398206;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oiIzWgo2ACmGpLKfLueCD8cX1zsKt1grMXbORVio9w8=;
 b=nWmrLb/D6GLCgtsrLMkUtF2QgNvxjYIb0Jvi6WdbaGu7XEbT0eWDmWb0Ak5hKz8vu5
 vRQ0zGXULx+DU2CsO4KQwbuycviFUsnUUm+Sz9OuzgU6o5inRjSksdyFxiceKF2gab1X
 r725kwT7zF1aIgeDWLQKqNPDodKigD32uVxx4XWzPhsr66hkzccGrUEniM9839pzuMoc
 QZIZ3Ed0BbkTw+mQq2sV/o/xRjf+VKAINJYObVKauStYvAvGoUJy69p/nWklPz/WY5ER
 QVyPVn+qZasFY73TC57oR48N61ENUnucYcgI5aI+LBZX4Pt5YxUwoIee8BIKf6wWBVCh
 JnkA==
X-Gm-Message-State: AOJu0YzkuEtUx9hNtCKsWkhL5RhHb7XmHZ0zrpEffPTcs+jc8V2xP5EZ
 50edj2jnkEhz1D9gNlwiUa/Sf1ATSpS/YsM4IiAXU0eoKBE/8ZBenxqua+mwmN1SbWkmPxGR53z
 CvstbDRUvpxgCyuA5x9q23WqWRcmVuM0zsEufdnaHksfwggESPiCdBMt/zg==
X-Gm-Gg: AfdE7cnwBFNF89QDOqHANGt6cvQU2wIgZZ3cCLQIj1Mb1Uapwgi2vQl/ixMXZPVtwbZ
 GKocNROrn7LsxrYl2DjgrXKVU9YTmoZHN31htjGdVC/nqFpL+6Xe+4rFJfS8XXMVKsoBSTd0buc
 yt1JHK/LD6kpCs7FJkUXHCFbD3DmEmFXa+vO/ET8QaBc7rBYXAKCyWnDENT7nJ8kFwQCzNQUYR9
 m/Jg7jJnUjcI/7mi0LzqftEXhq+VoLofPZkoeAVUcmQDUfE46uXWPOYuc3SolBFktgz3Bh+hDU8
 9V+aro20LGQbpittJ3b19baAG8hIPEMjHjl1JPaB1w/bgLtNz83sxrtSNJEf4OhkG+Nt+cQQ9aG
 58uG1tUyT+h6MjO7FDR6vl1qa1O2EXXsrbfnY3T686DNTpVEpeHe2p92OevtQ+g==
X-Received: by 2002:a05:6102:50a8:b0:6d9:5eaa:6d9c with SMTP id
 ada2fe7eead31-727c51cec36mr2652364137.12.1781793405960; 
 Thu, 18 Jun 2026 07:36:45 -0700 (PDT)
X-Received: by 2002:a05:6102:50a8:b0:6d9:5eaa:6d9c with SMTP id
 ada2fe7eead31-727c51cec36mr2652341137.12.1781793405561; 
 Thu, 18 Jun 2026 07:36:45 -0700 (PDT)
Received: from [192.168.69.213] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa96f0esm284654915e9.12.2026.06.18.07.36.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2026 07:36:44 -0700 (PDT)
Message-ID: <f174b13c-2678-42d8-b59b-b14d7e9177cd@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 16:36:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/riscv: raise access fault for Zicbom MMIO-like
 accesses
Content-Language: en-US
To: ZhengXiang Qin <qinzhengxiang@foxmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <tencent_4EF8937D817B836D3D911B9B05491B02950A@qq.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <tencent_4EF8937D817B836D3D911B9B05491B02950A@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MNpQXsZl c=1 sm=1 tr=0 ts=6a34027e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=bDN84i_9AAAA:8
 a=Wo38fnyJPC63dEFqrDAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=J2PsDwZO0S0EpbpLmD-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEzNSBTYWx0ZWRfX7/mS5NBIazB6
 xBRMXqrkU5TOpbfwDMc1A75wl9jRCur4qmA5hSdYefRg8//730uuNsb0DD9di9jSGLwN0IOZ+kY
 X2paPrnEwsq3wKAouhR4wVXM85vmM5rZkahNW/Jf9WVkdbxRk0gnBPG3tAttyuKNc/ycfYM1enE
 IEomLL1QTnsFOSP6KW2/1f6rSoTEMG2jC6jd5iOqokH2aRu1+hAFFG9//QhMi2FjaqWAvEpbzQT
 /19p7IO8jk9mUNtVf0mY4eVEbtXBod3CHpqQ5pA/91Qn1/jZN9ctUbmOX4so2Fop2tqcqC6FnDO
 vwNsc2nvn9zTmF/wTM71Xnplyx+xOUf8svwmxOkfTXXlcIDrie7hPf5ZzichNfogM9WM0pWPlCE
 LDC03lm/Q/c0Q0NOXSXJHm6cenHDxwr3uQQeo4hur7bNw4JfFuaDzfsaOrKZEoBqSopVQmNb32M
 s+2hS4+SysdgbpYWAHg==
X-Proofpoint-ORIG-GUID: UmIj6IqD009r4-1CXmk3k4e3W4b2J1AM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEzNSBTYWx0ZWRfXwfKzYx5OUcOQ
 nfviu8eZyoCYXBr8Yp+X3j+DBFpL583LI1iIkI+wR7EwakBskrk+dm6r4qJUKTnqY0AUccZ3wl8
 Yw+aM/JicYcm9n6TuOaUVuEv3laTeFQ=
X-Proofpoint-GUID: UmIj6IqD009r4-1CXmk3k4e3W4b2J1AM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_02,2026-06-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180135
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

On 18/6/26 16:06, ZhengXiang Qin wrote:
> check_zicbom_access() currently treats any probe_access_flags() result
> other than TLB_INVALID_MASK as a successful access. However, a result
> with TLB_MMIO means that the target is MMIO-like and should not be
> treated as a normal cache block management target.
> 
> Raise a store/AMO access fault for Zicbom accesses to MMIO-like regions
> so that cbo.clean, cbo.flush and cbo.inval do not silently succeed on
> non-cacheable/MMIO-like memory.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3501
> Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>
> Signed-off-by: ZhengXiang Qin <qinzhengxiang@foxmail.com>
> ---
> Changes since v1:
> - Use a bit test for TLB_MMIO since probe_access_flags() returns a bitmask.
> - Keep Reviewed-by tags from v1.
> 
>   target/riscv/op_helper.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 81873014cb..f23b060585 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -218,6 +218,7 @@ static void check_zicbom_access(CPURISCVState *env,
>       void *phost;
>       int ret;
>   
> +    target_ulong fault_addr = address;

CPURISCVState::badaddr is of type uint64_t, can we use that here instead
of target_ulong?

>       /* Mask off low-bits to align-down to the cache-block. */
>       address &= ~(cbomlen - 1);
>   
> @@ -235,6 +236,10 @@ static void check_zicbom_access(CPURISCVState *env,
>        */
>       ret = probe_access_flags(env, address, cbomlen, MMU_DATA_LOAD,
>                                mmu_idx, true, &phost, ra);
> +    if (ret & TLB_MMIO) {
> +        env->badaddr = fault_addr;
> +        riscv_raise_exception(env, RISCV_EXCP_STORE_AMO_ACCESS_FAULT, ra);
> +    }

Maybe adding 'else' make this code path more readable.

>       if (ret != TLB_INVALID_MASK) {
>           /* Success: readable */
>           return;

Feel free to ignore these nitpicking comments.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


