Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F7D606A31A
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 19:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RwVUblXi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=greZnAB7
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xKKrn-0000a7-3i; Fri, 23 Oct 2026 15:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xKKrl-0000Zj-FT
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 15:23:49 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xKKri-0002dN-2o
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2026 15:23:48 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69NIZu513259773
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 19:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0RIq4jJ06Gx29BCdGy2lGG1bj4yP/lpwn/B7lrSdX5w=; b=RwVUblXixXvlbX6N
 zstyklCvVaYoQJlXxS+0CSr05U/jGsIvaNYULmg10GH3pL57yfVr5SdAhAz8moX9
 /yQWc9B6QunmhYnRRf/AZg7sbsKHxrgcapdjOzTxO8yCDVNEARXClM5bFDX0Ctlu
 6B+5m3K/Mq0KjM7oiqLe2JFU1hRsrQO68f/M/Z4P+u3mVfiOFRCFGwOQCb7dEa5H
 zdD+Uq+lVtsxVgPzuZAAkkmro17EMEXYjAV7b1HXSUe7+TkN2Z5//uCeWJH+7lZ4
 /NLFO4TwfOubDvKgdShf4qVoL+FDF8tAJXJ4AIxAwtTc8e0qBkiyyrPKdrwqkghk
 n+OD8Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas6rq85-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 19:23:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5338c59f90dso39947671cf.1
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2026 12:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792783424; x=1793388224; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0RIq4jJ06Gx29BCdGy2lGG1bj4yP/lpwn/B7lrSdX5w=;
 b=greZnAB73kJ5X+L0bQpGYzjnKckyzjLdixk7y04jypYs7+z5bMmEK39/1861GE8CGz
 jKkREFvPrOj3X+ShN6rPEmjkgYjyGYd8fKJCCF9oJbnkd1eqaVG4N/5yJBGtKfnsCHEz
 09fRp/Lh8ZsVrfhAK6Zmo1hSSd8DBfLs5miiDovGlk7+U8aajDWGnMPR7jdKoGDx5r/A
 +WQDxk1p6HgaoaNYTOhOVeL/3Isb6Q3zWruZUpjU7oeKsYKRwaWS2IX6vpPxp/aRcKmz
 GC/IRh3qgYIr5C8WgdZa5m08OAEMGzi2acgahzO5QKXhAq7vgGskvssHQPUM+dsj0pWC
 7Xrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792783424; x=1793388224;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0RIq4jJ06Gx29BCdGy2lGG1bj4yP/lpwn/B7lrSdX5w=;
 b=n4UwBCx11/XfkE4J7K/l4A7Zl01jUc96vacdCzpUxe6NAM6Elknd6iLt0BawmZrToN
 eh9Mr+Hhhy2TNMCKgO9meSF8C9ef9xoEscrjw0aQNbr4tSffcUziUbsHFw/R2nX3F10F
 NcyitE1+ssHFBcHyrOVMDis/A5YKxosG5jBfPcwgMuFoSXUc+7AKo9jqp0CkqYdAsGWm
 HP/ilAJXYmYleInSmt0nWYq9DJnotkygCgnMB/UX2SwRDBebTdZNewnC1QDYL2JbELlT
 Wyr+YKWWWve7MRSb2yxbp+TmS85YyGjLyXLltcxCdkivsylhFHM5mjTcpf5CbWK/6kl4
 Qhsw==
X-Gm-Message-State: AFq9FYIKuNF9rU3nodpZkJLHkaREleeDd/lQOnx8qeDfddEafHY5+RNl
 qoue9OCTgmIDeuoneIgGEn9kIFkSlTfqECk3cydndjEzt/dMmK1u+vspWLz9ZdZDzTquPOE3FJ1
 7O3iiPJDntP9JI1E9RYhXnzfOcMq5NkrPA/DWXHgN/uJcgIDpGF+OrGxtsg==
X-Gm-Gg: AYBFou3QhiO2CU3p9TRoiKv+YzpAEqLQL0zIyP53Eh8woZn+KetVzqzGvrFW5LbZPBf
 0TTRbMG70rq4ijkX+MIjWXlvwsYLCS4bvYJuiJP7BdL41VAar5P0sFMeXOt+f2htkb1tpElib+L
 zg681tXKqfIPML+aSwFpjiNA0omo9/ejlm2fWRFT/Z9bg2fmZJEi48UQu+rcgv+i29QL+vzA+3Z
 gdNE3k47xz18rBIe+6g+5IMOj2q79Cnxtmv7i+BH3KkE1t78FYbJpUlzgMihgHEOy8Z0OwNoAnZ
 M3vdxCq6qpXitbS0DTftsID1lvqXzCX3xCF5WPMZ4EbgscyZWF0OovL5Ska+ZkrzKZ5WrODgGWw
 Z1aUy0t6e9qhaDSjwTMNrn8cjI+v/c5UaWBnk
X-Received: by 2002:a05:622a:1ba7:b0:535:a5f7:d59b with SMTP id
 d75a77b69052e-536ae202205mr101564431cf.42.1792783424013; 
 Fri, 23 Oct 2026 12:23:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1ba7:b0:535:a5f7:d59b with SMTP id
 d75a77b69052e-536ae202205mr101564241cf.42.1792783423602; 
 Fri, 23 Oct 2026 12:23:43 -0700 (PDT)
Received: from [192.168.68.104] ([152.234.125.162])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c47c6f3bcsm2539586d6.29.2026.10.23.12.23.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Oct 2026 12:23:43 -0700 (PDT)
Message-ID: <0c6acaea-4990-4723-9e25-0ea0d11e0530@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:23:40 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] target/riscv: Only save vmstate_debug when TCG is
 enabled
To: Wang Yechao <wang.yechao255@zte.com.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Xuemei Liu <liu.xuemei1@zte.com.cn>
References: <20261023021237.486091-1-wang.yechao255@zte.com.cn>
 <20261023021237.486091-5-wang.yechao255@zte.com.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261023021237.486091-5-wang.yechao255@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA3NiBTYWx0ZWRfX4QqhTmlbUZi9
 P0yGVSKSjwT+Qo06OQTy3oguT+hjTxzkmguDK2WLrHUvXd2dC9gCxp8/lQ1dGz4gQQtNEjyhgVI
 v8wnI0KwHhX3Ns2PQ0LUaUIHGK1mqpypya9Nkq6FF/2zpHScwLPR/w4/MFY3u+2CCMqOl2Sh+cp
 1DrwXDOxe8njKAT1PUWBmnlZFmAjNPqUjf9A9wgfRTmCgccttXpQcsjrppWw2C3JutA+s4bYtkV
 ueJatIC6I/dFJwLVZnapXUinqXiMEJa9NAF9c6AoR9lLIl4oJnQ0wT5lnhm0weSrs6bfPpYqIF8
 Y3LrgarZT51KZq93Qh9E88GSld7ZHCjHGdJEWzm80LndZv9z2nw16O/5dNckUYs1bvmiTEbs+TR
 NZPNlstQNC/kibVkdLsHSTrLSeYWAp1rw5O+Iowqfp6B+un7KMHK5wr9A0F+Fnff3GCq6O55rCv
 wCEo62edynW7GrHH1Bg==
X-Authority-Analysis: v=2.4 cv=DK0acCNb c=1 sm=1 tr=0 ts=6adbb440 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=AgQEunjic7gIBKSbIeB6Ag==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=1RTuLK3dAAAA:8 a=EUspDBNiAAAA:8 a=vNpfg47zEZen4TmNQBwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=kRpfLKi8w9umh8uBmg1i:22
X-Proofpoint-GUID: aoxCLUUgCennp7amrrCrH6Uc1SD2cEdO
X-Proofpoint-ORIG-GUID: aoxCLUUgCennp7amrrCrH6Uc1SD2cEdO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA3NiBTYWx0ZWRfX0ha7hHnbTzD5
 JkSjHGDF+jxwLs/DgrKqHaLLqe8ZWdsnpDbuWiLexLxOh/UhzpaRjm5kS5yZGLZu4UfIULpbHCN
 LPdhTgrlx7YP+06p/Wvs0A7rvGMNsAA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230076
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



On 10/22/2026 11:12 PM, Wang Yechao wrote:
> Commit d45b9bc65515 ("target/riscv: move TCG only files to tcg subdir")
> moved the TCG-only files into the tcg/ subdirectory, so env->tdataX is
> now only allocated and valid when TCG is enabled.
> 
> However, cfg.debug is always true in riscv_cpu_properties, so
> debug_needed() unconditionally returned true and the debug vmstate
> subsection was always considered needed. On --disable-tcg builds the
> corresponding fields are uninitialized, and attempting to save them
> triggers an assertion failure in vmstate_save_state_v:
> 
>    qemu-system-riscv64: ../migration/vmstate.c:737:
>    vmstate_save_state_v: Assertion `first_elem || !n_elems || !size' failed.
> 
> Fix this by making debug_needed() also require tcg_enabled(), so the
> debug subsection is only saved when the TCG-only state actually exists.
> 
> Fixes: d45b9bc65515 ("target/riscv: move TCG only files to tcg subdir")
> Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>


Alistair, I believe this patch can be queued separately from the rest of the
series since it's fixing TCG vmstate that isn't related to the rest of the
AIA changes being made.


Thanks,
Daniel


>   target/riscv/machine.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 0de06e9588..c5f0261ba7 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -324,7 +324,7 @@ static bool debug_needed(void *opaque)
>   {
>       RISCVCPU *cpu = opaque;
>   
> -    return cpu->cfg.debug || cpu->cfg.ext_sdtrig;
> +    return tcg_enabled() && (cpu->cfg.debug || cpu->cfg.ext_sdtrig);
>   }
>   
>   static bool sdext_needed(void *opaque)


