Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BBB606A31D
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 18:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mhWx35R6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IldkXJX9
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLltb-0001Kw-Kv; Tue, 27 Oct 2026 14:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xLlsl-0000aX-C8
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 14:26:48 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xLlsj-000537-Hu
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2026 14:26:46 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69RIHOlp2945702
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 18:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5gtNOSL9DkqGrvLv5HiCmciZ411PQzVsYtj0F/yuWWM=; b=mhWx35R6EzRfQjVN
 1xH7p7SD7YTepkSQKvJRjnJdAwgY3XESWxBjR4e7n6msb3JPozQgoQDg0IxUxvi9
 hh1y0NovGCLazoZMOvJYn2VAHMfRpp6z5/xUwqSWFKtr/SwyQiyWAJkZ36GJbrcZ
 tjsFwvJyI61eqNejUo0z1ji7yPaKzlLipLt9pj3r4nEbWVn/Fzz09FJXK9JSFAbZ
 ZzwCiBOs6tcDrhMUPVudgOC8nrmUw8KJgoNXP6ql2E1i1/5zSNRRCklwLpyCRxdA
 XYxo2Z62g5QP2nNWOWLa+A6cCrxb3JWGzPLY6TIq1iZnyMlyQiHezOf0cPJEU92M
 nJptmg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq6aeyg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 18:26:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93dd3c3badbso11255385a.2
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2026 11:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793125593; x=1793730393; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5gtNOSL9DkqGrvLv5HiCmciZ411PQzVsYtj0F/yuWWM=;
 b=IldkXJX9GJUPJRDL0E3iTHzlryQjr0M6sN6gmNbVRAxpEg6NLhHKlCo4atW2yo9me3
 CCCOq3jGW/LrRzoWSCta1AAa7V6cPmgT7z8UPzEoeiAE5AfihZDlvMci8VEYdo5AlbXX
 Q2B6CUxofzDLyydUWWzn8ge8U8TOlxOITB0Kc/si2EtcK6LYVsAlbI7EnGQ2o45oOZF+
 YKNq5kHOElfRG141nz/G+xi0L48LdchGx/eZBwco7FLKUHFZb8340saWsaAaX2fkNNAE
 e3l3TxbbjDvBbhIknGeDOA4JfKmQZJuAyS7IRnsJf4yrbc6cLAZHyYk7SDc9Mt79NF+i
 w9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793125593; x=1793730393;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5gtNOSL9DkqGrvLv5HiCmciZ411PQzVsYtj0F/yuWWM=;
 b=GxUCT09VFX3yYXJLW9HIi5V8dwidSDZigBCI/qkgJdcN9ieGcoZNI4rLOc7XpPx+5c
 CTnDJzOxkn5cu6vldAd/y9ia0PZ66F9Q8IMpJ7wmfYQfYO3Avn8+4DRHLADz+lafxQcK
 xAusaR9AwpZAuvzaxW0J4eBY6EYUakCmq3Q71VyIEwlF1HfMWvFA4m30ykwxptMQp0Vd
 C0OsAP7h40p0Qck1B2c8gAOEonGoztR2evwEaNIhkAEfV+DCqvd9LVbqNOP1DzNM0yp7
 ERE71ZFWWz2pL1ZLpDzrE6LIi3zBDa7lQSakRN/lU45dtaWiewOIwDPBQn0P+LmlUvq4
 +6Bw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxJc0/ugM63aEx2syH6uOk34IpShMqZcheCjG2O7fdQgp4/oNXt+/F7mXuKMiRw3GX7vINSYKj5k42V@nongnu.org
X-Gm-Message-State: AFq9FYK3B216y0pn563CMj0GUCIgkNugJCIlHY17JG8V9DMxE26aBLFG
 kAS/a/4I7wG6VS0vgLkg3cT2PRO0sH12f9Wo7/LVki6rz43i+0hygqKSwnOX3toonKpH2rAFHNm
 YfQWp9W3XZsvzqLGqjxpssb47k3IDo6SH1MpHYSmeyvoICqbTolgTFZr31A==
X-Gm-Gg: AYBFou3Os1v2771s+mSt+mPfhn7Yvb4ehZqyX6CaubK+jYqWvhs3ov44cASlyhR67zN
 jUfDcaAebDorKPSZlk7EQ6jzLoJNl269KX74MK2KsxzpMVMObogJjiofblY2g+0IGlsC9UK9ndl
 CXAFr9TIW4D+0nKAqspDMFE7DiX0wHbj7IAUwYugCHWmBJ08YJmCE1CIFqSOgcGhcs8Pi4xpfs/
 aYUWx0/MXZYzaodXlJzder26nCa6rJ0hrY66NGu+6BrxRUQaxRqUfe5cT8OH6J44voaTewkXeDy
 1fD34eyFaM7ymXWsECm/DNGfF0/Ek6ycj2dpDTrfbmOrupcIkeQZbP4lQD3jHfczv8WHpYA0nxH
 32crA/oRLT9vjD/ST14YtBNFNJEaRIq7WNjZBV2mqbm04fheXFQ==
X-Received: by 2002:a05:620a:2b4e:b0:93f:24c5:f561 with SMTP id
 af79cd13be357-940ef9457cbmr1583433985a.33.1793125592788; 
 Tue, 27 Oct 2026 11:26:32 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4e:b0:93f:24c5:f561 with SMTP id
 af79cd13be357-940ef9457cbmr1583427885a.33.1793125592323; 
 Tue, 27 Oct 2026 11:26:32 -0700 (PDT)
Received: from [192.168.69.229] (82-67-153-177.subs.proxad.net.
 [82.67.153.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a94e6b8656sm23975e9.10.2026.10.27.11.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 11:26:31 -0700 (PDT)
Message-ID: <5ca7722a-cd6d-47eb-b8ec-4c93ef4d4699@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 19:26:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] accel/kvm: mark kvm accelerator as secure
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Chao Liu
 <chao.liu@processmission.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Amit Machhiwal <amachhiw@linux.ibm.com>,
 xen-devel@lists.xenproject.org, Sergio Lopez <slp@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Bibo Mao <maobibo@loongson.cn>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Xianglai Li <lixianglai@loongson.cn>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-s390x@nongnu.org,
 kvm@vger.kernel.org, Alexander Graf <graf@amazon.com>,
 Song Gao <17746591750@163.com>, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20261027181400.1752951-1-berrange@redhat.com>
 <20261027181400.1752951-10-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261027181400.1752951-10-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0ecd9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=R0rOnUjNbK5cqpqgS9oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: PcWMN3zWYsnThwj2eTZ2-ghV3kAwNfQ_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfXwbGL8ozWz88L
 A/0n6gTbl+tUxgBL+VLT7dZOGA7DYoM+sbkakaUfOXUZZDqug8j7ZENQvB0l79MQwj8ZtP4y26C
 VAchQkKf3ZlHy+O3ve7IFIPkoxAquZw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfX7jzQnsnjDbvC
 qMAwkGjFXeJzgcidSIv5X4MqcAINaANWbMKvhzaWxNE2Xps0L2uS5m8OtoQnmFP7vUyAApzW4P2
 hPRLGg9CDCutixlH/dnCQVq4tN8lpwaHkyoprObI702rhI2seWe7vrgMSOKK1/mAexhutzozU5J
 gtzwO/bTrg4fNn7iIS30bFKYU0OKQL97zJ/8ZoIwsbD86b+JIFHK3IWvAFm5G0rvqHrpp++0pDv
 yQdH+C78YUzZD2NdZw0lRMeatI/cEpwlqnd7xeT1SrNPsjBlluoue1LZw68v9P2ZHYiV3+aA5gi
 efnVu9WFg33G6eM+9yuWliAEE4SWJcw1DTurhFZ4gSK+nXyrJY9vCLKhvoyDHvoPnrKT/7byVCd
 gaVQhzypT3RrgcsK1Baxv8KM8SuHCrKJctu3inJc7WIPLwyeXsJfjAWj71IM34Ncdk9lUeUxqXa
 SUpncGvdYdJJrcU/1rA==
X-Proofpoint-ORIG-GUID: PcWMN3zWYsnThwj2eTZ2-ghV3kAwNfQ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270073
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27/10/26 19:13, Daniel P. BerrangÃ© wrote:
> KVM is servicing virtualization use cases which must provide security
> and actively maintained.
> 
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   accel/kvm/kvm-all.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

