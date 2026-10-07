Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D627ACA6009
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 10:21:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEOlw-0000Fs-7g; Wed, 07 Oct 2026 06:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEOlk-0000AF-9B
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 06:21:04 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEOli-0005y0-P4
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 06:21:03 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6977jWf03298217
 for <qemu-riscv@nongnu.org>; Wed, 7 Oct 2026 10:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EgHO68FMBkfr7TSpza7/01c1bex5whJfNiOkJiLep4U=; b=Tz3Ht9JRNOdEjOhU
 PRenTQKr13a1i9kUjWKqGe1Puvj0dcprnvLpQYHxkBH5uxwqI3yDhy64kjpI/Hyg
 P6GQcQm9ifKuNh32aKxVE3CnYT4NiywejUSabR8FeVcEDE+wCE3Ae54tJi6Ql/QZ
 5Du7BfIU0gJynnQiumy6EabU6v+RJ9OC6DizWD9TlogoxmBHELR1l77vArU3Knhj
 j7XhXt4FQFg2sGAcHADy93iGVFLouR2Wt67X6nCe2avv3C/GqqnQ52Rv64MR9q4o
 gf2reY6K1QFnJMtFoeO0+csLlJaxC/hVQ1/AJUSrsUnna1MngBu/I/XMKF9HbriJ
 +N7bJA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5hdcrmg0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 10:21:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-936aa34873bso759699785a.3
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 03:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791368461; x=1791973261; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=EgHO68FMBkfr7TSpza7/01c1bex5whJfNiOkJiLep4U=;
 b=ZXCQdE8avoQC3e+9zwW+QhJJ01otcRInEUumyk3+WXueZh5cm0e57dcXxnMBHk+xeM
 uUul6b2aGLhLRa6oMNbedzx15Xl6ALREA2uhjFfE1Btcs86MaXm2p6geqiG8JaOhfpJ8
 zoiPIKafeko9KMkTJbTI3a5Vu/XgDfkPQWPy4UP2WCp4qs+qcbQ5s/Gcsx5jFUpiRxUL
 2DPAhVhwjGSJb/5vApGdta3YnIwhs2HjqmLmt52bI+gg9c4g3ZgNdTZH71SnUVrLjZ2N
 VQce3m0VMjZej2nafXhbIq3OFFqN8F7kyMObnWhUkbib2EneT80gfiNoLrjhsZcS5SF1
 MN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791368461; x=1791973261;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EgHO68FMBkfr7TSpza7/01c1bex5whJfNiOkJiLep4U=;
 b=UR8hNdEl3W0nann+/DR3Bu0jH3jA6RJeqsBU6wqwquv9flj0VtZj/09ZCa7Gc96DqP
 8VlMvplsiQXc66R3jkiDrGVKPyyc4dkhWSRNHsnGYdzLVSGryj4E2bdSZg2jfwP5fTUR
 cKuL19oYS8YUu6dGad7a1YipQJhSm98qJsSpwmqsQ3qy8YYKfLvu4w3YT/hyTg7Mmny/
 hR34lmE3qjN3a3PIO7RMbhF9bl0mD2K9tQjtj5WljeW8DJoauB7/buuFAxfMQ1JKqXGa
 QEff0c7HS0yGZdDpj1G+okoHZEzbC6iPxsppap9b2WBcsWin0AFQuOEBcJXiZKJy3n3C
 vPKA==
X-Gm-Message-State: AFuF++mrXCAw4WLyrzOwMe+iJUi2iGmAR+kEZoGDbvII3kCVwbK8Zb9z
 +oW0zOg9bsHilIXpTsM039a9UOzQNvszTkgsgHTEuq0okm3SYFroBOvGO2oCbSNgwnvkXGakLvW
 jIP4j0K7feGCaQO8xmlOyLMrY6nw/9ollmlKs74KkqqYOQVxj+pZ919GPpC9+NOstSswp
X-Gm-Gg: AYBFou3UJWvdI2KQok0kIvadymEZiKS/+K7Bm8rg4SuIgzBPqMhzcyfzfB3en9ktlCO
 cuqwErFUicrhjzskMEN/ZLka1VUTgzhx9OSZU/KD6qf0e7IaEykTHVL0v3ivoGeB/yzLdr5RTCi
 Z9NbJCkSiB8/8yU7VeRWQ8Kn7DfosqJlOOx07T8O265VBIzb+Ko4Uwk+/qDikzNNUIr2G245p1I
 HuI3wMK8npcpj655pT3ZG95HiaeVnIO2MPMaJhtPH9KLNS4rugAYwrlFjyBFcWChwvRmEUw4n05
 lb8VFkfJshkK35dnhvf6nNQkf4afUHHS8UwVyffBjt/XTnrLfBZy79LEUx2HNWRuXJYr36oFB21
 5TtMKT7bT+JbImpeQX9zjcTDyBOWJUbyy4g==
X-Received: by 2002:a05:620a:1d06:b0:93e:9809:8385 with SMTP id
 af79cd13be357-93e9b87fd17mr331858085a.69.1791368461017; 
 Wed, 07 Oct 2026 03:21:01 -0700 (PDT)
X-Received: by 2002:a05:620a:1d06:b0:93e:9809:8385 with SMTP id
 af79cd13be357-93e9b87fd17mr331854685a.69.1791368460349; 
 Wed, 07 Oct 2026 03:21:00 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c71c0b7f4sm4703619f8f.17.2026.10.07.03.20.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 03:20:59 -0700 (PDT)
Message-ID: <0f320580-3c17-4e9c-aab2-3123323dc960@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 12:20:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/18] target/riscv: Compile cpu.c once for system-mode
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 pierrick.bouvier@oss.qualcomm.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, luoyonggang@gmail.com
References: <20261007-rv-dedup-v2-0-8a2f0f296a7f@rev.ng>
 <20261007-rv-dedup-v2-10-8a2f0f296a7f@rev.ng>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261007-rv-dedup-v2-10-8a2f0f296a7f@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3ucLeciB5e5usfyLIKtPZ8n6l1BiVKtt
X-Authority-Analysis: v=2.4 cv=aKFlOr9m c=1 sm=1 tr=0 ts=6ac61d0d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=VxAk22fqlfwA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX56a+zAuPJExd
 uewJy31Py3b4EykWz15CkYT3zLv14jqw4cjflAZ5/zyuvz0uvLSP79PgPF0tm3TtysjGZZWqTs5
 7LuAFyvj7d+XoytSppgo7lHDmA03i/w=
X-Proofpoint-ORIG-GUID: 3ucLeciB5e5usfyLIKtPZ8n6l1BiVKtt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfXxVBOXAebggj4
 2nqpbc7tx/hjcrd9aZSNQCmbEq46BiFyifXKsTXAh3rgAMH6d2a3rTzUjCIVghCBjXn8fciH7za
 /wOt8mAGTCcTGhrXhuOHdm3ONjAkrPYku0/ZlgrgoD5Xt+kIf1ekOyrYq8ahp8uxM83x3/WFG72
 xaJVhaYsnCOON2PEujS9d4T3/RadMf4jryZZkI3eoUN4TS2akezAqDR96ZiCPCq16Ec86QG9t/A
 Ih7hqoAqx5ivUr/qVoDvKVjuQu/xgRGXVZScOIwKvfoU/06HEf87ONwbvDkmWV5xJAlQuhVvC8n
 15Z4RaqzyCcbnGMfSFhmjrsfhbWVWSw2EqicFyv6HaEnrojogbx/bGtGM1i8EHsvrlgc5qzIiBW
 IHXLWiNTdwxD6WbtG/vWbMJzDWromLlEsp48UXUzyF0T3/PgYrR9+FerftZ7IW+GNz5J1EViDzh
 1I1DfI6JNwxz/lu8kmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070041
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

On 7/10/26 10:43, Anton Johansson wrote:
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>   target/riscv/meson.build | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

