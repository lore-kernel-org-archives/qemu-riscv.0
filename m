Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14109CDB471
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 11:45:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcM2j-0000ax-DF; Wed, 24 Jun 2026 07:45:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcM2c-0000Y2-Ms
 for qemu-riscv@nongnu.org; Wed, 24 Jun 2026 07:45:15 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcM2X-0000IQ-EU
 for qemu-riscv@nongnu.org; Wed, 24 Jun 2026 07:45:11 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65OANqUl2503972
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 11:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aURg9Rydjqo1qjZk9/UBXUGEZKeCe7brLhZ8ZDxQ7hM=; b=BSZpdC/3X9l1/Sva
 09/6gGb3eTW6RD7lez28Y4cjuouzd8j2XetJM9ZNHMZ7U+Ja2hvyfwYSi4vF0TiA
 MYU6dC6WTG4lc0kM97gw13wwYi8girriiu+CgJK2UttMU8IZkdKUTAcUPaKtsxEO
 k0pNgrOB3kBmWghbVKqoz0Puu346gyrjOo4yRg3tjrP6n4vF5y1TPA6863fOg1Ad
 fDVt1eJoARc0isnGBfrW+8a1+O7bn15v/n5iBUgznQVDozMb8VrW2qkV3VUuXd/R
 bdGDtYFnYWUeYu7cKM7WgD/Ebw/1co5InBQ4IlXXDrViYAv4zCGnymMR3Si5oRmC
 VysS5g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05bfa1e5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 11:45:06 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-139d0f4a9a7so1150079c88.0
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 04:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782301505; x=1782906305; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aURg9Rydjqo1qjZk9/UBXUGEZKeCe7brLhZ8ZDxQ7hM=;
 b=in0aUKaN+9r0ZRB+NmbdX56x0vJv9N/3bvqDssxwraKRwvWfQZkjw/tL3m8qDfvd+A
 oHiU6Bx/S9FVS5JjGBTGRdlxi3FeylVQfrdahLqhalhN73g2Yg8Bz03+32VeLE18UB89
 WFfN/Nq+NDhdUtEIyYVUi5+viMA5qeQWV+/Qp/mHUATcu1Edj/FQJV0Z/YVLTuIAM26f
 rS1se1FQ/q+m1+YzVhe6MzECWeSRJYD5J1zNYA/LQyA31dfRkbdwiDzG5aX5TtDZ2/5k
 QFedhfQLWFEynuSnIwOgjU1WFh7jmkIaO3YpOFAvqzGhIzhwKJptCynBW7dXD/XU1Jtv
 eodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782301505; x=1782906305;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aURg9Rydjqo1qjZk9/UBXUGEZKeCe7brLhZ8ZDxQ7hM=;
 b=T/MfAhhUe1rZOphtXKnXxkwWdyrnUwu0/hewo9eOx335enNZKNg9cdg2e8IGVXUOn2
 vI7wlO4JZSutBVjrtBXJBsD84cXsYp5czndaNj2gFQeBz+YqJNK8O0QiBuDuXNgNRImc
 tvYLjBcvgzPgeTIL4cvhYfOjF5PD7WxbnJAUhenqXlIxfa24oYWVJ94/ja7DLd9YaiPY
 camVGMi3U8TMoSuF0Q6XHV4ryC07/yU0dV3c+P1HKooccJr58EHAvi8wi9h0tmcwb+LI
 0bp+XdKJvNQE8U7LaSulZFtPXcxEUHQu7NKr6gF9Ql/5Cs57y2PZqg1kT/9ITz9znq0J
 dqAw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8fYJPMfC26HnZbHQafKdLJL7E2n6gTvcujEiPChgl5X20Dds5ew45OEmMJ+bDzChxiLTXrb1enEgDQ@nongnu.org
X-Gm-Message-State: AOJu0YwgPjze8LpWsVnlL7DrHEiuoIBkt5n48ElUsFUaiwpqjBarcQ3B
 8Pg/GJwSE3bQpBwTCKHOZxMxi/DVXtBK9iyGiFG4Fp/BvcYL/oGQZ4VE/ArDIjmd22SfDdi/tlM
 CDqXElbeDeEiYScKNamk4a8LizVSioxGosFBilEoae8BeFQlB1ABBuTY9Lw==
X-Gm-Gg: AfdE7cne3XgO5b8rd9Bk9MKA70YLKzE/6J03Alqvq0s7kbd0fikfCvLHHRjMOgJ+M++
 aNf0C46kEZSamAjX3lE3uKtpdAz73wFgycQKy+KNGiIZo5cPDRKyALstyDS/dgvclW0OReUianQ
 6nz78YlYpWvROfLiGnbakyrNj1Q4FvAoZYSdeGvqwgXguDZSV1HeSpAuupSAohfSU9CK+NqrgZU
 iue0Va4+TUMJN65Vq/uXzr+jlZEKH6V4rQesevqn7PXmjPCSrhyoJEBk0ht5v31hB0I0sPVyYBw
 urB96fTsVUygIiyLX38I7fEwUY8C7TQ0qCLbGBiSBrt0v8Ulqmp1Ukmc5HTX4U+6rUq/soDYGpT
 aa3Itq+Bi3eabxjR+5ONu8kd9CH6xY8q7jbLFBNjglYVV
X-Received: by 2002:a05:7022:239a:b0:128:cf80:deea with SMTP id
 a92af1059eb24-139d0bf341bmr2136418c88.1.1782301505405; 
 Wed, 24 Jun 2026 04:45:05 -0700 (PDT)
X-Received: by 2002:a05:7022:239a:b0:128:cf80:deea with SMTP id
 a92af1059eb24-139d0bf341bmr2136398c88.1.1782301504852; 
 Wed, 24 Jun 2026 04:45:04 -0700 (PDT)
Received: from [192.168.68.103] ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-139add5bd68sm21667597c88.11.2026.06.24.04.45.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 04:45:04 -0700 (PDT)
Message-ID: <861851aa-b3ab-4dd1-8edf-dbeb008750d6@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 08:45:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Generate illegal exception for inval.ir and
 w.inval in U-mode
To: stephensportia@gmail.com, qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-riscv@nongnu.org, Portia Stephens <portias@oss.tenstorrent.com>
References: <20260622224534.1923407-1-stephensportia@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260622224534.1923407-1-stephensportia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X8Bi7mTe c=1 sm=1 tr=0 ts=6a3bc342 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=p0WdMEafAAAA:8 a=pGLkceISAAAA:8 a=t9496tuAAAAA:8 a=QYG0MOca-knv6KCjgzUA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-GUID: 6naA2XEvmJabsn6ioMhaY-o8MM2ozxHy
X-Proofpoint-ORIG-GUID: 6naA2XEvmJabsn6ioMhaY-o8MM2ozxHy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA5NyBTYWx0ZWRfXzJwHzS1zWkWu
 r2BKIaZHBi2d2Bg+WQLbs7qCLUoEXvyJj2uhwIjlHXjepmher/THorfD1KE6Ur+tIAxfED4DXrl
 L968qXCefw22kivsABED0NAWj9EhGao=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA5NyBTYWx0ZWRfX+U1GgulvAtvq
 CmhdG7g+5g4nLFMJ3hQT5dOM1Q04u3CH1Yanbs8Wsjrf2G0LeRUPzSImgg9wtk8AG8AlgViCZSY
 ipq/MD1QU5cBwoV+oNlUPL58XiYEaeyqMhdV5A3RA9APqo3cgR7llq3QjF0WhfnIYZcR58FQYC2
 YpknSSVKZXYf3YBuO3MU9iXTbLn1SJWhwVOdbqczdYnXbySzthEdAh0pDL/lDbw4/41PoOtnX3/
 GVDHLTo0xkgejqYHyX9bzLTNBV0nG/b/pfzbODYWEgbj/YkIwzcajuKblhdNQXi4MuB9zXNRu7n
 +9EFqidOs5KA3LQSuxZm7oscvieKvvBm7epL9/ahjtko/LyGHL65tStBUjYZ/CLwqRYMwShTwLH
 7+yIEOqLWF9/ENPffgAX28To6CjNhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240097
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

Hi,

On 6/22/2026 7:45 PM, stephensportia@gmail.com wrote:
> From: Portia Stephens <portias@oss.tenstorrent.com>
> 
> According to the priv spec "Attempting to execute SFENCE.W.INVAL or
> SFENCE.INVAL.IR in U-mode raises an illegal-instruction exception." Fix
> the current implementation to generate exception.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3543
> Signed-off-by: Portia Stephens <portias@oss.tenstorrent.com>
> ---
>   target/riscv/insn_trans/trans_svinval.c.inc | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/target/riscv/insn_trans/trans_svinval.c.inc b/target/riscv/insn_trans/trans_svinval.c.inc
> index a06c3b214f..10cb9e32b6 100644
> --- a/target/riscv/insn_trans/trans_svinval.c.inc
> +++ b/target/riscv/insn_trans/trans_svinval.c.inc
> @@ -39,6 +39,12 @@ static bool trans_sfence_w_inval(DisasContext *ctx, arg_sfence_w_inval *a)
>   {
>       REQUIRE_SVINVAL(ctx);
>       REQUIRE_EXT(ctx, RVS);
> +    if (ctx->priv == PRV_U) {
> +        /* Set the virtual exception if virt enabled */
> +        ctx->virt_inst_excp = ctx->virt_enabled;
> +        gen_exception_illegal(ctx);
> +        return false;
> +    }

I am afraid that the bug is already fixed in master by:

commit a4a35544e43220657f718a5d0be5ab49c6129000
Author: Zephyr Li <fritchleybohrer@gmail.com>
Date:   Fri May 22 11:31:44 2026 +0800

     target/riscv: Reject Svinval instructions in U-mode


We now have this macro that is called in all those insns:

/* Test if priv level is M or S. */
#define REQUIRE_PRIV_MS(ctx) do {          \
     if (ctx->priv == PRV_U) {              \
         return false;                      \
     }                                      \
} while (0)


That said, your code is setting virtual exceptions too.  Feel free to re-send
this patch enhancing the REQUIRE_PRIV_MS() macro to do the same.


I'll close the gitlab bug as dup/already fixed.  Thanks,
Daniel



>       /* Do nothing currently */
>       return true;
>   }
> @@ -47,6 +53,12 @@ static bool trans_sfence_inval_ir(DisasContext *ctx, arg_sfence_inval_ir *a)
>   {
>       REQUIRE_SVINVAL(ctx);
>       REQUIRE_EXT(ctx, RVS);
> +    if (ctx->priv == PRV_U) {
> +        /* Set the virtual exception if virt enabled */
> +        ctx->virt_inst_excp = ctx->virt_enabled;
> +        gen_exception_illegal(ctx);
> +        return false;
> +    }
>       /* Do nothing currently */
>       return true;
>   }


