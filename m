Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525DBC43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 21:36:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wflYi-0005Gj-LZ; Fri, 03 Jul 2026 17:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wflYd-0005GP-QT
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 17:36:23 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wflYb-0001iN-Qb
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 17:36:23 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 663KQIRZ1022297
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 21:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zHASMPi0fJL7mRA7YSzLYg8FBeNZpN0PO0q5kvMR6Q0=; b=I5XyVjIO5v++rVSD
 L6V5zRxZoAa5vKmvjfBfnwUfbiZROkSLYP+FkCiUYLlSbR2aEU9x5y0RPdjqIudA
 MDWwGW0xUFmxlTFz0aufw/bSjV/TZcxOK3jlSM3L/HjmvQtGAkx9RyO5TR5XGpGk
 HgAx5FQ9z0st9DYLuPJBuF90Uu+hysfr5IpromRwptMuVjaWK+F3pdMQlmQgjgNF
 jrEd9RUFIIBuzCye0IiD4TJVn0ldHcNcsT+f12llxVhJ3Bwe0iOchlMN7LkNiuco
 GasS1IVC075RQPruV/LxgmyDDWIbdBgTQJ9Dj1r3BkCZRxzISzxbK6oo3dF/aq0e
 zeXDXQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u32trr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 21:36:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92e4f27f49bso73185585a.0
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 14:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783114579; x=1783719379; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zHASMPi0fJL7mRA7YSzLYg8FBeNZpN0PO0q5kvMR6Q0=;
 b=PioPDxgUpWkcTKfAuKb0J2lrbsD+DybnrkCJG2i4sFNYMqTrMm6pLc5rT0rXWzTHqb
 z+Ix0nhWiP1NtY/cxr8yvnTETJp4kxCHxN7B1O/iIXNecYqCfYMk43u0UFV014I1Zm+k
 rHWgJwou75j91NqNnkG+TN/bgaoVV5lT+CEx1ycrwxLwv5Tb3LSeMwyPFbX1cLdp3qfi
 Thu751056bD/9UPDR+lQcVms4RJ03hvj4Zx0Yp9XGdw37TD3PMpr19oXQQCsiT8/B9CV
 hJGUyokn/HL2irFNC2HcYI3ahPt2FOO/9F5FYYhGsM8/KdNFPMe+IOScOVcUyt9vWTT5
 XlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783114579; x=1783719379;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zHASMPi0fJL7mRA7YSzLYg8FBeNZpN0PO0q5kvMR6Q0=;
 b=ntYelQmr4El4J5yJwY0LSEYqenG0boVQMgN3SZuV/JayMgYHtKtz4oa2dJ8q4Wz5C/
 FvTk6et9ZOQZtguG7F6xvDMeacRPz8TdmctyIFeC7wSnkX4CuTWXTxEMP1JoT8CKfiHY
 M9HmL3b7cntvNPlYc1dcTqVq2Z8bW/gkc3nFPzR/+5nzNK1I9Oz8Z8g9oaoI02iV2dYw
 0vlsh666hti9WWB/cx1TZ3FZNP9K8EUtkoqyRGJWVl60Ehbztr5x+36QUDF6nghOVQgK
 RFOyV72dGVH4urOzRSIwA+CvUs8T3X17YBUGRs4qwrTuq5bqvFdAXOOy20umO0uUhOH3
 DYfw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8H61GdbyAQNnh2qR449o17QmzbSE2wCXSDkvXz44wZpBnna8PtsrOd+PegLcUYan1mwMHDdD469Np0@nongnu.org
X-Gm-Message-State: AOJu0YyUfUiL5dz39spX8SndL9CHbJTGJ6mdMw2ibzS1jFoeA2VJoT/h
 SjbcieqaqqShqTtzGNvZwJkOltoqw+Z2ZjtNv5bzbHb+4ApEtH3+ZpXuM11gs20Ffg85gQ6fuOP
 VKUiEe4xzOYC04gYH3JTQ235qk/+1glBK6M5mpjwnR93tUbcRPvuA440h2A==
X-Gm-Gg: AfdE7cna8GycTlNmZKweDBG24tbIUfRhvEn9+HSXRyHKETBf3WzSDamEv2DGbCzxc+Y
 7McoQalnVkfEI3geiwSp48JYXVKZUfFeC5hI5R9XT351Oyou1X1Ar9P1KTp5BzjHlRC3Kv94mD9
 LiXl1d15lWeu9kqnJCZWndTJA5nXxOseWKL7V1JNUUTCiqYa/xhQYDwX0ZY43AwJq05GqYJwhtK
 ZcTuCpEsuULbhVwMJJy/biJSeb/dabw4SXl1Y7QrPFRR+c4wgSSnlhLCn4l2vO13YWZWqABL/Y4
 ClqKz5mZkj7WgccFYfSkBTczF8RZ6GNsMUfq6wzD7bVb5Qk1/O0VruFAefIKBPsAx1YHCgDJkgH
 hZK3DTT1vLuW6ssncCUeZJBS5h1E3NFZQOF0MD7wtioBa
X-Received: by 2002:a05:620a:4405:b0:92e:520a:ffab with SMTP id
 af79cd13be357-92e9a43a4c6mr157166685a.38.1783114578635; 
 Fri, 03 Jul 2026 14:36:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4405:b0:92e:520a:ffab with SMTP id
 af79cd13be357-92e9a43a4c6mr157162585a.38.1783114578062; 
 Fri, 03 Jul 2026 14:36:18 -0700 (PDT)
Received: from [192.168.68.106] ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-92e90b804c1sm255606985a.5.2026.07.03.14.36.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2026 14:36:17 -0700 (PDT)
Message-ID: <ab8cd5ab-97bc-4c62-8225-6fd9d00e82da@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 18:36:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/25] target/riscv/debug: Sdtrig fixes and TT Ascalon
 support
To: Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, bin.meng@windriver.com,
 vivahavey@gmail.com, Alvin Chang <alvinga@andestech.com>,
 Yu-Ming Chang <yumin686@andestech.com>, Joel Stanley <joel@jms.id.au>,
 Chao Liu <chao.liu.zevorn@gmail.com>
References: <20260114044701.1173347-1-npiggin@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260114044701.1173347-1-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8x5A_n48JD7AMZ0rXjoYZOXxq6O6D7Fn
X-Proofpoint-ORIG-GUID: 8x5A_n48JD7AMZ0rXjoYZOXxq6O6D7Fn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIxOCBTYWx0ZWRfXz+DOKeIVTJey
 I6UqAza57A4ZzPGJtnw6BxTvCR9gV5+XEvhn0ahV3tFrI1pPB161dJbLLrXpkcg5v/PVAYF530s
 yltei+iRTVUvknKX4zH+CqvEWnGE8Ro=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIxOCBTYWx0ZWRfX6zNvGh7Yc/Xt
 jgim9yigdJ17Q/J2dYfUnUBPb97IE5xND45V/n4pmSzWfZbZMAAL6sqqHlUlwB/+7/kwA9JtU6t
 PX5wL8UGmHl97CSkV4pc1ElxWGdc/h//yN2sTTogoLuWf1WSSWd0iz5QdmC/qEahNtL3mMNVEeN
 j4HvREYociU1e+nEUnGvHIjQyyYtkIvb81NNcz04/3wP22h3E/nLC13LaicF7l2CdgIgX8IXC5Y
 bs+QkPs+Y+loGbgKN2RTgF4AoePvijyCKo8ZpfXK9YWCFjFVIXgfvenhyi5GPZl/yq/dLfTVoou
 dmvnaekCd/QZ374sfL2yeZ4QyEiYzKH6HH2Cq4zfSmgbbFrzNh3Rj3LeZYRLUqqA07Qh5GQ1VrV
 TDddGscxbGZpQKD7/MuRoASmq4rvkCyG4as3m2ZYZSt6PO6+CEHvw5WpA65noOfedCEnUY3X3n/
 /6ViLeiDQout2W3X10g==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a482b53 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TcOfpqZN13KGYs-Xar8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030218
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Greetings,


My current understanding is that this series is an official dependency of
the riscv-server-ref board, currently on v8:

[PATCH v8 0/7] hw/riscv: Server Platform Reference Board

Because we decided that we want to keep 0.13 and 1.0 instead of deprecating
debug 1.0 (see [1]).

We missed the 11.1 boat with this work and with riscv-server-ref.  No big
deal TBH since the server-ref board can use improvements before upstreaming.
But I would like to not miss the 11.2 train in the end of the year.

Nick, I already reviewed a bunch of patches that seems to be fixes that we
can use right away.  If you're ok with it I'll pick them all and re-send in
your behalf, rebased and with acks.  My hope is that this will reduce
the amount of work needed for the rest of the 0.13/1.0 debug code and
we can get that sorted it out.  Then Chao can use the new 1.0 infrastructure
for his 'sdext' patches, and then we can lend the riscv-server-ref board on
top of it all.

Let me know if that works for you.  Chao, not sure if you were aware of this
series so feel free to comment.


[1] https://lore.kernel.org/qemu-devel/383936e5-fcdf-488b-8f77-17fdee41243e@oss.qualcomm.com/


Thanks,

Daniel

On 1/14/2026 1:46 AM, Nicholas Piggin wrote:
> Hi,
> 
> Sorry for the big series. The Ascalon CPU implements Sdtrig with 2
> different types of mcontrol6 trigger and the icount trigger, so in
> the course of testing and bringing up OpenSBI and Linux support for
> this, I've accumulated quite a lot.
> 
> My new year resolution is to start being better upstream contributor,
> it's taken me a while with changing jobs and architectures. So I don't
> expect others to drop everything to review this! Joel has been
> prodding me, and noted there is some other Sdtrig work going on
> with the v1.0 support patches.
> 
> I think the debug v1.0 patches are somewhat orthogonal to this series,
> but both are addressing aspects of a common problem of Sdtrig
> implementation specifics. I wonder if these should be reconciled or
> left separate. Sdtrig v1.00/v0.13 configuration is a single boolean
> which is feasible as a CPU property. Whereas the entire space of
> Sdtrig implementation seems like too much to make configurable in that
> way.
> 
> Any thoughts would be welcome.
> 
> Thanks,
> Nick
> 
> Nicholas Piggin (25):
>    target/riscv/debug: Check only mcontrol triggers for break/watchpoint
>      matching
>    target/riscv/debug: Handle changing trigger types
>    target/riscv/debug: Implement permissive type unavailable trigger
>    target/riscv/debug: Fix icount trigger privilege check
>    target/riscv/debug: Update itrigger_enabled after changing privilege
>    target/riscv/debug: Implement get_trigger_action for icount type
>      trigger
>    target/riscv/debug: Fix migration post_load icount_enabled() test
>    target/riscv/debug: Fix icount privilege matching icount_enabled()
>      test
>    target/riscv/debug: Implement icount trigger textra matching
>    target/riscv/debug: Maintain itrigger_enabled in
>      helper_itrigger_match()
>    target/riscv/debug: Fix breakpoint matching action
>    target/riscv/debug: Put mcontrol load/store match address into tval
>    target/riscv/debug: Remove breakpoints on reset
>    target/riscv/debug: Move debug CPU post_load details into debug.c
>    target/riscv/debug: Insert breakpoints after migration
>    target/riscv/debug: Remove itrigger icount-enabled mode
>    target/riscv/debug: Advertise icount trigger type in tinfo
>    target/riscv/debug: Reset trigger type to unavailable
>    target/riscv/debug: Add new debug state format
>    target/riscv/debug: Migrate mcontext using new sdtrig vmstate
>    target/riscv/debug: Implementation specific Sdtrig configuration
>    target/riscv/debug: Support heterogeneous trigger types
>    target/riscv/debug: Support heterogeneous mcontrol access types
>    target/riscv/debug: Emulate TT Ascalon Sdtrig
>    target/riscv/debug: Fix minor comment typos
> 
>   target/riscv/cpu.c         |  65 ++++-
>   target/riscv/cpu.h         |  41 ++-
>   target/riscv/cpu_helper.c  |  10 +-
>   target/riscv/csr.c         |   7 +-
>   target/riscv/debug.c       | 571 ++++++++++++++++++++-----------------
>   target/riscv/debug.h       |  19 +-
>   target/riscv/machine.c     |  96 ++++++-
>   target/riscv/tcg/tcg-cpu.c |   5 +-
>   8 files changed, 510 insertions(+), 304 deletions(-)
> 


