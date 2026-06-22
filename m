Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063A0CDB46F
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 21:08:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wblrt-0000bc-9h; Mon, 22 Jun 2026 17:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wblrr-0000ar-73
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 17:07:43 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wblrn-0002iC-FK
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 17:07:42 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MJceb01938786
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 21:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GpKGCrMRzeYPWqDUIE+qCkrV9/ROixK392W0ijbejjE=; b=jGmmfMf09N97/9t5
 Ww1gaBzL7vo3L4N6lDDS8xP7g955j+Sus6+R16ptwbZnisHFdZ23JMJiNLGAvJhA
 p1j7NrbRU+h3+jnYokHDSxEl/paqP9lYGWTvYlLXTuX7uWcb9OY1NuBnblKbLYS6
 0Tpba4QA104xTobWtpZQvgxcPDIFN7eWmNg0LCsJGAkhp2z3jLQO7uRgADu+dIrw
 I2Rejv2ryrYhelMDB5ZNPA6OW776d2jf2GeYMyB0S7I3I2tU4DJ5noE5CQ7mC1vL
 rVTH69JOyh8CxtFk9Fxd7QzRwjb9dUsGVceh+ugkTctL9hCsaoqfe4vWezkVcV/E
 +imjlA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5ye9p0f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 21:07:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-91574ad681eso747682585a.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 14:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782162457; x=1782767257; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GpKGCrMRzeYPWqDUIE+qCkrV9/ROixK392W0ijbejjE=;
 b=HpN9HBWGapnUQl50VOSkaEHFCikBABBuqnBw1loim8SDMGEV3LmOZuKOv2laLxJ9IN
 EChxanQW/NxaWJDgfZ8RpvlFJmagKpYL3r2aMZoLSl8C2hqPmwD6FzPyr6WUzxIG4tXJ
 BLmvOVc3DXqx40d4ftyDROCzR83A4A37Lg1PP1S/FUd9zUs422onBwiYkT9wseIUgWh9
 SgyLzPj8Q0zshbkA9YzXH0pgZIKA0gbQjY7dCwV+V0MikQWmVOuyIxNOnbC48FB3ckaa
 Y+/fmrC41i2gynY9XG9RnmqQ+C4oza6S94QfQmGxhlqguQjlm9gw/HL6d0VzT38vN1o8
 dwdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782162457; x=1782767257;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GpKGCrMRzeYPWqDUIE+qCkrV9/ROixK392W0ijbejjE=;
 b=GUJnSCQ0aTF0yl1IYNWHgr2EMjVL9bThtRRQklFFbtWTPmWUKuxcC8Y2gZHiQsMjfb
 6aUVAJMNtC7UA2E4T5OlN8cC1i5e/qk7SVGJi6S32/ZU4kPpP2T2KpR6d5Y3dyFIVzml
 +BI0MbHYOjJOSGw4czG142OGV0CSQ6myEAiPGeMoqeffrIAEs/u/YABZOe9F/N9JZRLN
 UTdQOkIKrSRE57ZQ9bO0zx1EOrMyWDLB7fz6Cl0rdNoQE6cPvI9FOhewc+ES2lVUjmqV
 VvC+/voJOgbVZrcEXK6uJVa+JYhsuDtBIJNxWd++nVn6iHC+3iOLg9y5tUYUw140H0ir
 pk/g==
X-Gm-Message-State: AOJu0Yxt8kBcqSBVw4vIvTxSiZvqgJgPPrWzSlNoJgoiJy3oUcOk8olg
 5hdr/2AvRI15h3bZctUqyRnxEqYgbvkZ1QF1Ybg5pe1016yR8U2Eh5gq+6l9MRkW6Ont+/+S/AY
 KUJCERBgXrfmvMz2EXmuStYrSkKloxktVOitdAnUQiq8pDVVTFP5agdHkrw==
X-Gm-Gg: AfdE7cmgQa5WBaJwVWl2XnRHfUmUiOifA9g8PkjwwG9g1X6Fu1tjI4nqAd9KQBm91AE
 3Giu4/0lzviaUb9ZDbgZlVM5bPy568qPlIk7VJZEhGPj5eoErjQpJYBSaYPbBmcnRGXgCt+fuZT
 iKZ01GlURDqJMoeI+ORkRR6rsrbnmD6YvPX1bL04u/5ADNRhDtFsjRpUX3bQz1AZm2K8FSQt4GU
 lS36REAT8EYPGF84BXllzNDXfSoZyAi0JtRZBZSA7QV5v8MfIpDnahQ4MhU/66Nj+e0b/7RM1KQ
 7icAEzmBBaaqclGkRyaKsWEzWEK2XnHz4tY7KN4oCvx1PwOILJI7rmJS8gXkOx8WdoL1ijh7nrZ
 qrDgxOzwEH8BjeZCOOVHjE77IX6k44jBLBB532jjZbC4MRdvmI7vUcq/0ycpbYw==
X-Received: by 2002:a05:620a:d8e:b0:915:a111:86ae with SMTP id
 af79cd13be357-9209119a689mr2750221585a.35.1782162456760; 
 Mon, 22 Jun 2026 14:07:36 -0700 (PDT)
X-Received: by 2002:a05:620a:d8e:b0:915:a111:86ae with SMTP id
 af79cd13be357-9209119a689mr2750214685a.35.1782162456326; 
 Mon, 22 Jun 2026 14:07:36 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46666788547sm30907727f8f.18.2026.06.22.14.07.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 14:07:35 -0700 (PDT)
Message-ID: <ba5ce5c8-8493-48cc-90b6-fe304212393a@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 23:07:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/24] target/riscv: move some irq helpers to cpu.c
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
 <20260622193141.1449724-14-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260622193141.1449724-14-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: O5xWpnOtLuWvUKiUZqLUttuTWR-Attfs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDIwNCBTYWx0ZWRfX61Brk/QsRDaz
 zEkUAYVhRd1axWKc0v2Me7LeQ7wpnhkg5R9NLQ0MTZr18LHYb45RdfD9dYtyUIJaQw/UaGg8Z9R
 f2QKfaQpOtrbBfDkFAsXp9RvZ1fxBVM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDIwNCBTYWx0ZWRfX3TBjQTvaVOLj
 pqdJia96OHHvH1Lb4LCreqnxghmtTtqCex7CmX/zlh0+eKr4Imso5xuW916O19HtkWcFbagiIU4
 8gS0UeehqeeB7EXKqB7lIuB0rbz6hSDXSh5LPMSw5YeEwXYVfJar023PaM7jV9VT93bYBpK1rKN
 yWV6NCRhRIu+/1a5xS3Un8H8w7SX2nwnudOQZAEMQDEJ3vsbcQ/zc6qlrmcLeSX1fTPQgfber96
 yL1B7tjEBqs2pI/UA5B0/1mURAToUOrCYiSm3SGtNkjHiKLFGXmwu+jfqu/5k5Bp8wsywE5KFcS
 dnV5n6l3AB4feZwxGhdPOP2Hdl1+sqIadNVLWxiBe276qi6om20u2OoHlPMQr9j1p88X/G/cUB7
 yQYCvHT3OXxtnz2ctNV18Ea7LO777CgBdS0RvWCG6W9IpPT7a8NlZjXjJLNm+YBIV60A6SX6d4X
 4NYbboZOfM7zsdtu61Q==
X-Proofpoint-GUID: O5xWpnOtLuWvUKiUZqLUttuTWR-Attfs
X-Authority-Analysis: v=2.4 cv=YpI/gYYX c=1 sm=1 tr=0 ts=6a39a419 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=31tgaIbxqbOXDk-74rYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_04,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220204
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

On 22/6/26 21:31, Daniel Henrique Barboza wrote:
> riscv_cpu_has_work() uses a handful of irq pending functions from
> cpu_helper.c.  There is a very high possibility that KVM doesn't need
> the current implermentation of has_work(), but the common accel code
> needs an implementation of this callback (see cpu_exec_class_post_init)
> otherwise the KVM driver won't initialize.

Indeed I also noticed that recently elsewhere.

> Move the relevant irq helpers to cpu.c to allow KVM to keep using the
> current has_work implementation, allowing --disable-tcg to work.  We'll
> circle it back to evaluate a proper KVM implementation for it in a later
> date.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>   target/riscv/cpu.c            | 187 ++++++++++++++++++++++++++++++++++
>   target/riscv/cpu.h            |   5 +
>   target/riscv/tcg/cpu_helper.c | 187 ----------------------------------
>   3 files changed, 192 insertions(+), 187 deletions(-)

