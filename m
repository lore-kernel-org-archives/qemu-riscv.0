Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19C6CA5FFF
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 09:11:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xENMA-0006Nl-V3; Wed, 07 Oct 2026 04:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEKZ7-0000KQ-8q
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 01:52:24 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEKYv-0000UZ-EI
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 01:51:37 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6974UJdF2551302
 for <qemu-riscv@nongnu.org>; Wed, 7 Oct 2026 05:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jDqU1asXJVNklrJMBXsgkl0awJ724rKzgxqsm1RENOo=; b=bflIWJ6yJghTXTDP
 Ddaz3kCYbfcAaaE6sjzBi7izrIwz0+7ThU5MGFsDu3V28kL9REJdtiGSXd2U76D/
 1Xl4BokxmKXWL0oN556mkqRJXdWt6GhuRv+Zoduxm1BlmpB1v1Yds9nM210Dwvsi
 YDMcYWEvmO341CoSUdpQcFaOq6+E4Ij46vTxs6pFBSmQWYYjqarNM/03GX2oAJbV
 fr+qVN4tmPOH7zuqFpWw/R149MK6st/PgvSonRgxhFf1oKKxqJDyADokmn7fqH/a
 7Qucu/OM/SrHpD0I1q0zgGZQ7c3uXI0JQkDSJ6p78R8GvJ8VAQetLDNDN+/POrsD
 HBLmCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c678rqh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 05:51:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93bf4c0af4eso563256785a.1
 for <qemu-riscv@nongnu.org>; Tue, 06 Oct 2026 22:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791352290; x=1791957090; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=jDqU1asXJVNklrJMBXsgkl0awJ724rKzgxqsm1RENOo=;
 b=O1yzfR8pI5iowo0eBNxFNpm5Az6APM7vkzceKFV/Iar3mrL5CbpeKrfLRrGW1u3oBk
 tgmtGKM+oyb6LN9UB7SgQu+Wt9tstZ4UFSShpKtmWn+n1RBkT3Qc5ceVQLQ2cqH84U0L
 O7QaPRLZ6ECKLR3UT41MJaj2SK23FUBvBZUAbOjCnhY9MSZadZUx7CWd39iiURf8AfwR
 wTSU/jJHOtQdi2bfPQinN4OcwjDWoyY8xAaURmXTKvASDJ/ZFEzhQA+1xK0y97bLpFS2
 4luOWhbahR/5O61+1BSRMqnasGbtJ5/LQx1RcqsLoL3a1ISF+kiyOj8ACadvBJ4DGdwx
 thfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791352290; x=1791957090;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jDqU1asXJVNklrJMBXsgkl0awJ724rKzgxqsm1RENOo=;
 b=gIistG7n86WyeRCO4PU5LV1OriQBzi9o8bah7PMhym8bh4iJPnPNdxVRjYpdCzvQkD
 kjtOQulI4wGWOOr0UvlMrHwVIwn8EGHdI0hiF3QlsvZBy3xyxK+M+Vota+b2zrnWvVnl
 0pHPfluRGeDFgpT7uSTmMuWoDCOCh7X31cGKWrLff1VwW4uCcruGBoL+Z6U/DzcTbRVn
 ye1B0ao6pCxc+vOgh8GoR2ZYAF1UDG4PHVe+TyUXn+KVFT22OhfIl8LkMSI7RLBVuaF5
 YUFZs5DuSLQ13ZJX/rFG68XC8Gae5iYLifzTtCNeCMi8sUsXHh2BpE30ltk0p90AMCuH
 vgVg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxCKKEKKbxhQpidOb6x4xyT47bTUsC1tc47Yf5yzhWS39ixBsGJIgF1KO99rvACOLZKhwOMrZ8Qlv81@nongnu.org
X-Gm-Message-State: AFuF++lrul5SXUvvlGhynY/XltJGOUVUNVowo2IKpb/eqL63gyBtqbwa
 QkysfrS8qFrMrV3l4PRdL9/0NXaC+436H5xDpvYuwu9lm9gTF4dG2FvG/rYChXeiEr1Pun757nl
 Bqk9QczWZ+qXeEZs7PSEtT8gtPlSZRSkXQr6XFl+VFiYyJB9yXNcqxA1eYQ==
X-Gm-Gg: AYBFou1nv7s6MFBSV81h15nYy+J5TNsTjFo9L04SkhlP+ctqc5uoID35AcbsN7M6z2r
 B8NCnFm9neqQeell6x6pTGSYm/CFJqbz0nq892kYY0vCMkFqNtuCvhtMJxtG4Hatm6AljYfoxv7
 /uSUcRYEmHfpKPdSw/qo7mLdnP5EqRgBetOW66labuMHlTxWkld/5Lbi+Q1Yc6bECEhMN/rCKa5
 BD0EwsR1ZcSW872VSB9Q10Y/NV+/hM1AnT9rALPDd7wg46GnGRl29R1HYpY5MiAA/kSwCrGa5i9
 8fUVLjWZGFrKJ4901LePL2llvj8wJTkeJWxwwo4q5n4zM5TdTaDGdAjW9JoHjOC3c/MHlcu9leS
 i+187p98cNiVxKi+m8qR+jxG+oRrsa3m4Fw==
X-Received: by 2002:a05:620a:394e:b0:93c:290e:9e9c with SMTP id
 af79cd13be357-93e860404a9mr924134285a.16.1791352289927; 
 Tue, 06 Oct 2026 22:51:29 -0700 (PDT)
X-Received: by 2002:a05:620a:394e:b0:93c:290e:9e9c with SMTP id
 af79cd13be357-93e860404a9mr924128285a.16.1791352289477; 
 Tue, 06 Oct 2026 22:51:29 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18044c970sm18616775e9.4.2026.10.06.22.51.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2026 22:51:28 -0700 (PDT)
Message-ID: <d9f09744-4d92-47dd-a1da-6d20090662cc@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 07:51:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/27] target/sh4: Define exception vector constants
Content-Language: en-US
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Eric Farman
 <farman@linux.ibm.com>, Song Gao <17746591750@163.com>,
 qemu-riscv@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, qemu-s390x@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Rolnik <mrolnik@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Helge Deller <deller@gmx.de>, Chinmay Rath <rathc@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Glenn Miles <milesg@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20261002175037.1747-1-luoyonggang@gmail.com>
 <20261002175037.1747-7-luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261002175037.1747-7-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyMyBTYWx0ZWRfX5GVwV2q1xczQ
 0bgb6cvlTJiQoplAvMLx9vqpaLahYMwxO4jKLFGwZX8GNwMQs4mK9bszwp9ft2vt2wNu6poj9oI
 tWEMK+j/g+QFmwyT92pFLy21F89ly7w=
X-Proofpoint-ORIG-GUID: _g89hdmfRVqkz2rR0v366m9OVCEEcdwm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyMyBTYWx0ZWRfX1VHi7dFKPMw5
 qWnMgNliAldM7mk/fEBaETmeyZy0rxeIme7orLwoQB1ZeUV7ekM0AxtgXVDzipHwwOo+wMyph9h
 juQPb2BlZGbLJBzkqKCaBC8/WRb1vmwLEZr+5roRBlME7mt427fZQo1G3sK/Kyq0RyBW2uwGh/u
 UL83uh5fG6yqEB/SSN4BKxBUqwikv0MJntCqN5UkZqwdKmI0peTG3xbshQCOtH+R/US1BdNpHIM
 WEg0ik3MeytV+RolW0PmnAOYZtFRWiVD5JCXeRSWj4bOuWfxxBm4yqgm3kAh0Ov4x7gjiX1PBQ7
 PWlqLAqHjobdLtaYto2Js4aPXyZROjdPANR+4jBnagsF7GfWvKcPMY3v573qD6nMJ6OVaDo2IFM
 uzlZRWqkvaF31XW7C5zojqRuMb9KGmFsj24cWP36mlHTg57riWYGEpxDZyGUyXEzda9AsqOayqt
 jexxcyr2oFrWR/YLm7w==
X-Authority-Analysis: v=2.4 cv=OfcNnRTY c=1 sm=1 tr=0 ts=6ac5dde2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=5KkIcTHh3hzyv8iDLVEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: _g89hdmfRVqkz2rR0v366m9OVCEEcdwm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070023
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

On 2/10/26 19:50, Yonggang Luo wrote:
> Name SH4 exception vectors and use the definitions throughout exception
> handling and exception raising.
> 
> Signed-off-by: Yonggang Luo <yonggang@gmail.com>
> ---
>   target/sh4/cpu.h       | 21 +++++++++++++++
>   target/sh4/helper.c    | 60 +++++++++++++++++++++---------------------
>   target/sh4/op_helper.c | 16 +++++------
>   3 files changed, 59 insertions(+), 38 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

