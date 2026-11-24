Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476C7606A31E
	for <qemu-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 18:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OEfm/7M8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OddqSBPX
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVvTc-00073n-RC; Tue, 24 Nov 2026 13:42:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVvTX-00071o-PY
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 13:42:44 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVvTW-0003NM-7H
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 13:42:43 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AOIY7RD1651298
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 18:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cxpoWgHQqt2hbfkPA+aU8hUPX3t2PqgAkidOp3MiNIo=; b=OEfm/7M8WI41wtXy
 MCqZG9xQu8/MYjqMLP4bS5NqManxWlu9mHBdiFZk3P45i3kHNnm2W0J6vgwKxmhB
 RPydZqGltTBhL6W4IsYv8pn53XNN0Bhon5Nx/BpYxI0wAO0y9i2ZxII9XjBN3n2n
 L1+VkNjcyoFu8dmoEIEXvE6p1BXF9Ua4lNfw0xRD3LRH9fVaahui1L1BZr5AqMAt
 xX/O5cZsAvlZkv1FHXuojec/rQHyvEH1rJttzFTrLDoc/NTffcqheayOTgOa0U3R
 pM3aIV0FTFvGQrYQUQOGnTbtYwqEPPXhb8pSe7yW+ufg7UViaM+D+g6Kg3pQax+B
 idYBog==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpkf8f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 18:42:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93909014c85so923582985a.0
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 10:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795545760; x=1796150560; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=cxpoWgHQqt2hbfkPA+aU8hUPX3t2PqgAkidOp3MiNIo=;
 b=OddqSBPXJAH1YNXoWxWOvDtVd7pQY2ypt19waz/3mYUYp+bt2qrUCvxyvz/u0us0MZ
 4U2pmAGdTVpVVKd1CBAJr+AjkbvErU+Ut1wYkuO9L9bjYNVAiOvu5oaeJwfnNMRavhVz
 c57J8+HAt1iNCqm/XGFE+JkicI3d8k0i3dF9G3hO3eRNyyGPhKFfhFVT5z6lGftvva5Z
 CI5BwrMX1vqDHfLGEwrAnD2CXBOYIUI14NDSviaGNqwAgmN+Z/a/a7tZQ8ZxHAQjVtSc
 OIiqVz5i17maLISBpJqwfrYB9mvbNFwSjSzLcvDoZ0vetLjLtn42QQFrRIetAAZ97bWl
 zZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795545760; x=1796150560;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cxpoWgHQqt2hbfkPA+aU8hUPX3t2PqgAkidOp3MiNIo=;
 b=I7nqph3yJ5ctcYfFraqpmCmmAiZDxgqJ7bYoqvdbXUHlRhwnBN6IpGaJFw1JB4eHSm
 ZQLH5WS1eXNfhr4gFukhpAjGOD6BUpwo5JhWOGBE3goa9v9g6/YXFJG/WhWLWipusWlg
 +oajBf7I12khIHRsGTHnguliEIEgQYuUoxtCddb9qByETs8q2b/uz1JcIeFZ/h1pamc0
 w1IsPf/6+Du4cHAj6ieRgzPBI08Qm4GQT0JdLPXWEe05r3/1yNnMMMR0UowskfAGvGVc
 DnblxbcJ6CAH/sHegfLjIIEacji1K0QNWpGx6wD6HGFFXufm09HIADNZfSZSWfQ2pemb
 WkAg==
X-Forwarded-Encrypted: i=1;
 AL+hErFU1Hv70r1EF0cxNs+NqgbCu1x1m6bUn5FrCcLzGMgfL/is3QGhrhaEaJgSmtuPAp04nYLDVcBwvMql@nongnu.org
X-Gm-Message-State: APuU4Z9uVDuG2H8T/0KglSAD3nFwUYPzA3uBMRKvcLb+jneUnxukQxU7
 f4mOB7pgN/Hhn3Qp9+5b2NTwcD2HLNYWh34oKHB/Zuw4OAdqlFwlgSHW0x44CgQxMkWPW6GPiZv
 Sf6ATCT0kQJFABV5lEyhjgeGOI2rweUR3OWvQhP30LWmSODtsQfOciputeiFoX+Qp1Q==
X-Gm-Gg: AZFdTZeNHQg1lhHWokL8JVzjFF6l07Y/Z1XIyyESQj2kml/5WTtchM6137Dqj4ztc5Z
 mlmJ1+w+l36wD7yT6a72oAHPpgdTYP9c1SNJiuyafeCpmkyr93m0yqxsBgWtPXHe7vkuz5KcPLL
 y9bGk3bP/L9yZqR/VEtUNn46Oz5lgvxQ+SILZVYKolBBTbgVsIpP8+m4JZeDqw3GOr9F5tDYmoL
 fMA0FvmSNMWtYZluWMueLL8AdEc6H2YmtanwdP2Kij+lcJg/HN9jk3FG+8nu2dY2TdKijugTBlS
 G6A7JwbMIzu7JuKAFbThD9j+YMyIqhDAqZ62b0MQ7bRNKJWm8umO5MfaQoNRK5/dp/nPS2y8e4P
 wtFoXBgjxS2Cy5Yr2rlGGC/QGQVdZxSiAv8PjXItHAWnGGNV3SYo1irkAhmAOVx6YPdToLuPhns
 0jn1qTOkTu
X-Received: by 2002:a05:620a:2996:b0:949:74d8:4719 with SMTP id
 af79cd13be357-949ba9b802cmr2630280685a.44.1795545760197; 
 Tue, 24 Nov 2026 10:42:40 -0800 (PST)
X-Received: by 2002:a05:620a:2996:b0:949:74d8:4719 with SMTP id
 af79cd13be357-949ba9b802cmr2630274585a.44.1795545759628; 
 Tue, 24 Nov 2026 10:42:39 -0800 (PST)
Received: from [192.168.68.101] ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949bb0315f4sm1100251285a.3.2026.11.24.10.42.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 10:42:39 -0800 (PST)
Message-ID: <098d1da6-b17d-40f3-9917-eace9774c216@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 15:42:36 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Provide weaker memory ordering for RISC-V guest FENCE
 instructions.
To: WX Chen <wxchen0913@gmail.com>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
 Tao Tang <tangtao1634@phytium.com.cn>
References: <20261120-fix-riscv-fence-20261119-v1-1-aeb9ba142598@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261120-fix-riscv-fence-20261119-v1-1-aeb9ba142598@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3MiBTYWx0ZWRfX/+LfkDm6Ok3F
 ZGNJn35tDfOYsWVlo+t8rnUDkOU++dxtFHyHe9kvPkO79swpUI228pM0055vPctrbssRpatvWCW
 C1ZwM+SKZEl3T7DyOEFZnaXM5qjzS69QHL5ir+JBUniVE/VJ9+hbLY7XKPAPLz15DdQbo3lMQ2b
 HzUWqPmrzEti+QB1jWWOUKHEhSAt3N4NjG1ey+y3KnETqLd9SpgQcwkAnz1LqxWKFDP6HAmivM/
 MBAy8H3tjSe7PHKIuEvtOFvoVSGsafUnAenHQulJfcqoIkzKPlLqDn7pVdiVAvbq0IMt6/pfdn3
 W92FZ2QflkLKzQnYQPvHA5O5ulALkiIBS+IPViRO3dRGYyt6bi4ydcIkB/VfZB4pS1lr8jQjhTk
 R7Zf5yGhp8O2OiglbGM041m8TIRNiEYEeR+/RXCwcwPJqvwXRnih61vuQ2k3rQfAdxA7nTcRAgP
 PRwwMeidpf6VgKA/hQg==
X-Proofpoint-GUID: 3xKZJjh63ofBrUuA2XiPBW6LJrHi71D-
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b05daa0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=QxFdwG9AeuzbvbumJb4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3MiBTYWx0ZWRfX35HmFTWg7rBs
 FjRSA8fumVHzHj8C3luZFukL4uMtsQ+XRreZCFYT78oEhGoRQu++1xUdgsN6czSyv4483kYkFv4
 LrTPn2sPZyF9/jijKBNk0LQ7u2o/oDY=
X-Proofpoint-ORIG-GUID: 3xKZJjh63ofBrUuA2XiPBW6LJrHi71D-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240072
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Looks good overall.  A few comments: the commit title

"Provide weaker memory ordering for RISC-V guest FENCE instructions."

We add the submodule we're changing in it.  For this patch it could be:

"target/riscv: weaker memory ordering for guest FENCE instructions"

One more thing:

On 11/20/2026 6:34 AM, WX Chen wrote:
> Currently, they are implemented as full memory barriers, which may introduce stronger host barriers than the guest actually requires.
> 
> Signed-off-by: WX Chen <wxchen0913@gmail.com>
> ---
>   target/riscv/tcg/insn_trans/trans_rvi.c.inc | 36 +++++++++++++++++++++++++++--
>   1 file changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/tcg/insn_trans/trans_rvi.c.inc b/target/riscv/tcg/insn_trans/trans_rvi.c.inc
> index 4784ea1607e74eb5b0076425a732b5d3817b3482..6e094e5886360c2f9f7c187e82e6f60da36b84e4 100644
> --- a/target/riscv/tcg/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/tcg/insn_trans/trans_rvi.c.inc
> @@ -968,8 +968,40 @@ static bool trans_pause(DisasContext *ctx, arg_pause *a)
>   
>   static bool trans_fence(DisasContext *ctx, arg_fence *a)
>   {
> -    /* FENCE is a full memory barrier. */
> -    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
> +    /*
> +     * FENCE.TSO orders all R/W pairs except W -> R.
> +     * For TSO, the pred and succ should all be RW,
> +     * otherwise it should be treated as normal FENCE.
> +     */
> +    if ((ctx->opcode & 0xf0000000) == 0x80000000 &&
> +        a->pred == 3 && a->succ == 3) {
> +        tcg_gen_mb(TCG_MO_LD_LD | TCG_MO_LD_ST | TCG_MO_ST_ST | TCG_BAR_SC);
> +        return true;
> +    }
> +
> +    /* Reserved case, choose the strongest ordering.  */
> +    if (ctx->opcode & 0xf0000000) {
> +        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
> +        return true;
> +    }
> +
> +    /* Normal FENCE. I/R for BIT 3/BIT 1, O/W for BIT 2/BIT 0 */
> +    TCGBar ordering = 0;

For our current code style, unless we're in a ifcond branch or switch, var declarations
are always in the beginning of functions.


Thanks,
Daniel

> +    if ((a->pred & 0xa) && (a->succ & 0xa)) {
> +        ordering |= TCG_MO_LD_LD;
> +    }
> +    if ((a->pred & 0xa) && (a->succ & 0x5)) {
> +        ordering |= TCG_MO_LD_ST;
> +    }
> +    if ((a->pred & 0x5) && (a->succ & 0xa)) {
> +        ordering |= TCG_MO_ST_LD;
> +    }
> +    if ((a->pred & 0x5) && (a->succ & 0x5)) {
> +        ordering |= TCG_MO_ST_ST;
> +    }
> +    if (ordering) {
> +        tcg_gen_mb(ordering | TCG_BAR_SC);
> +    }
>       return true;
>   }
>   
> 
> ---
> base-commit: 08ed97c33c3818ef51a7c852347a28e9f66807b5
> change-id: 20261120-fix-riscv-fence-20261119-10a425b78673
> 
> Best regards,


