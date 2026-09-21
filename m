Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9803CC982ED
	for <qemu-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 13:47:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x8eMG-0007VF-Vu; Mon, 21 Sep 2026 09:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x8eMB-0007Uo-2Q
 for qemu-riscv@nongnu.org; Mon, 21 Sep 2026 09:46:55 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x8eM7-00047l-UF
 for qemu-riscv@nongnu.org; Mon, 21 Sep 2026 09:46:54 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68LAe7Je1414284
 for <qemu-riscv@nongnu.org>; Mon, 21 Sep 2026 13:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DOctR8bQ0dvpJy1dFyYDmPtWPKBSC6hbXQMzKh+dYxg=; b=d/Uq2P7EwJQGl3vB
 87OERGTOHF0fYw9hcrjr8vCnvfCMwVB19ZmTr9R0JQt+wm66P/VoVozheBdeCsnQ
 My88Cv8fk1HwhbsvSjPhGHaKHNfyLdm3F+1hNmdckr1Fd0KKXCr+t7Aa8s91785e
 YYnGXbfmUtjr6ZG8gm5EtbrfRXZxLqzjsUjXk4+LV38lNFPJwBXlsfUKRaiO6Zjb
 5jEqxBTJsXO0GHHYFyXhSVwcVVrxtiM4Evbzk6ZwUJ7SfUFxwJBAUQcHGMBQ0DBZ
 G5iNuTFJzNXbl8E2SlcwRBbm79Gm0Onlis92tndlOSjRnfEmNcqlf1nedk95B/RM
 Y556gw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d1h2h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 21 Sep 2026 13:46:50 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-78830f4bebaso804891137.0
 for <qemu-riscv@nongnu.org>; Mon, 21 Sep 2026 06:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789998410; x=1790603210; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=DOctR8bQ0dvpJy1dFyYDmPtWPKBSC6hbXQMzKh+dYxg=;
 b=NmlWy+l2H58VzaWxP3L8nQLc9SJ5W6oPpYFKGcvv8iB2DYxgm0WrCPhaYNf8ho4Tn+
 W8cR25CnJkzlbwmziKl7P8yKOrtxyFiMOBvhmUHzfZtUuBB6L4L5lLFbN8HnKE9HP5nI
 0uK8FjzVJfeyPsAzAjH0t9PKERUjXX/ouW7Z2ONJIXiKWCvvsWYc/O3IrLJbQSbFhGIT
 d/4yWb0JqkZ/nM5Qjugt+0d84zWB8J6kzFx8J12xtL4N4iSOBiKxra0VQ0XO3Bq5Wydd
 259coFf4iiVFIs8EREyiL7T79OSIlx+kv6LrCCRUr4FxK05z9xLI98F46oaW4eKwhPbZ
 sO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789998410; x=1790603210;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=DOctR8bQ0dvpJy1dFyYDmPtWPKBSC6hbXQMzKh+dYxg=;
 b=HS01A309H7ldb+m8p43ZiTvFyPVHfXprX/VU4Urw25apA5//0r6ijsGKPj5xmmJYqz
 ZZOYb1KNJCBf/F2OfliqJCTIyD1oKaVhOJiCLg8jSSV++IeMDBEDK6lDlXNBFFqcvwlB
 CZDhWpBNItVTvNdA80YYECNMUtszvS9kn7ollzalBYBlsvQsNqHGzihYrT0pRzAip8VB
 w62wtuzydb3wrxDdKQ9MU/3uFFsAvb2tRh02AUfxH+IFsJNjzwJZ09+QlDr5VqjEkxtA
 qEyOs5CSuDMSxmFdc+VkXcJSUYNlZTccPocueZSuxbSLpKWUksOXqMZcQqR1JS4TTDfW
 hHpQ==
X-Gm-Message-State: AFuF++kgzSsqIM0UvxXjeU+lsA7iVeNtHeKOmJJUFJNuZhJM4U8xIhJA
 9+k9V1iC+J//bnmDhYTd9tuGwXnx/G825K7lc605+TGkmEOMIk3Qb2vG8LbnHHnffOYCCI/3QjN
 KwIe63L+0mpuPKVkqLk9tXyABLZ4/S7+D4dljRJGVtpQvLQELe7TlRUXNxw==
X-Gm-Gg: AYBFou0+NG9pLL1xALKxx7EbX1AqjtXEOrBJLy1LexhgH4oPwCZankdNN4bxZ2RZJqs
 iy8buCNOvjYYNYT4Jo7zHSg/146kSpuVrDw5h9oK7ko4vytOgUPKm5aKwEmcT/GSWA5oZtgtQm9
 LWoBHIYV8CJ85cju8ACbQB3JfqyF2EDkJK5xwhGmT0H266tJtNCdURjX9ulZ2rnpCTp0px5i2Rk
 TGRlqSLKb8+ykxj74y5nwfFNVyFUPBfIX+NE6nKfa/jkBjOyLk7+9M0AQFyz/zyqTMNS6L3Vryp
 K4v6bvHl4V2eWqYUK6m+VVQK4fGxq8zX5CqD91tBGMrlSmh/Rfmgi23ErpJvXt7E+HIGIJ/xM37
 uaU46/kCJ/ywEOSDAroNs
X-Received: by 2002:a05:6102:5124:b0:7a7:19aa:f0d3 with SMTP id
 ada2fe7eead31-7a719aaf734mr2221114137.32.1789998409871; 
 Mon, 21 Sep 2026 06:46:49 -0700 (PDT)
X-Received: by 2002:a05:6102:5124:b0:7a7:19aa:f0d3 with SMTP id
 ada2fe7eead31-7a719aaf734mr2221070137.32.1789998409498; 
 Mon, 21 Sep 2026 06:46:49 -0700 (PDT)
Received: from [192.168.0.4] ([79.127.134.47])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fcd115dcbsm228167975e9.15.2026.09.21.06.46.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 06:46:48 -0700 (PDT)
Message-ID: <d26280c2-c4f6-41fa-9b30-e4f41e9830bd@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 15:46:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/11] target/riscv: Move target_long.h inclusion away
 from cpu.h
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 pierrick.bouvier@oss.qualcomm.com, palmer@dabbelt.com,
 alistair.francis@wdc.com
References: <20260918-hw-riscv-cpu-int-v5-0-f98c5a244636@rev.ng>
 <20260918-hw-riscv-cpu-int-v5-6-f98c5a244636@rev.ng>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260918-hw-riscv-cpu-int-v5-6-f98c5a244636@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LxzyRvZ5XTylwq_MpzZHmNERfGxq3gNJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIwMCBTYWx0ZWRfX1RzcJhX6SY6p
 sRDXV0lme9w55sWMvXA+HVXXH6W3wSeqwa8SuJ2VphNgBP2FKI/zZDeilqU8xVtW3FKFQYKluFs
 zYqNMFiWKIQRhfDZom0wPOBdr+WLzzE=
X-Proofpoint-GUID: LxzyRvZ5XTylwq_MpzZHmNERfGxq3gNJ
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab1354a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=btlkdZlGvBFwkIDmIYSHuA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIwMCBTYWx0ZWRfX/A423YDyGosx
 oFAh9K3xAAfw2RDd1oR4qjCQE5k3Uk/MjahasP+lrse+L3TlTthYpTBK6UpIC/8e0pAAsyCe6yn
 HNo++xz950ndt80bbCDSTfqak6fd/Mod1Gb01+SX0TLA6AhrQFRq1/0srhqXen9Mde2C1uyyI7E
 sHG4JVLgEz/4L9SlpjdMgk8Ala1vdtFKKcMZppl5OyJQKQ/KwVY/wEeloC7RZAiJ49Znlp5JhTv
 NaQhV3/i9AC7tdw1Ri+kaoIpf51dMP4wwfDPS4polVPj4aLVQCxgi10uxlGIOyN5wrkaaR8Y5z4
 usF1XR6rsm0htl/KFZqzXZPo1DQ3Ztw2RnhKA4mR21fs3DhpfCT1x9ujMEH5fxHOr4GxzS/ZMsN
 /OK0vPgs0nqCLYhNMjhfU/bTA/v3AllpjS6YYyL6nH/YGDXWR15kGr2pqxhiYDl56D1CvMEU5Ux
 yLBI+S+LtaxAYlsUDtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210200
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

On 2026-09-18 0:05, Anton Johansson wrote:
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>   target/riscv/cpu.h         | 1 -
>   target/riscv/internals.h   | 1 +
>   target/riscv/tcg/pmu.h     | 1 +
>   target/riscv/kvm/kvm-cpu.c | 1 +
>   4 files changed, 3 insertions(+), 1 deletion(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

