Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A40CD98F2
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 20:53:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbldQ-0003gM-DI; Mon, 22 Jun 2026 16:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wbldN-0003fw-I0
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 16:52:46 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wbldL-0007Gr-J5
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 16:52:45 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MJbFOd2122450
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 20:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 q04zAzd67z3/qNYdFwffqoykOLV8m1yykTVeARIonOI=; b=nymwXhlWdG3O6T+7
 p0/gtKKk6LRB6asROeunu8ntRdmlhIxfgt9JeEl0qfGjtPoCdHSgHt4nAv1nunax
 Memr7+0XOtYKwNCQajJAY/Fx3KwlF/UB0KZ+pIhfUUuiBtH7K1B2AbQu3PjFRY4W
 XpT15l6EOLunH6iwoR460zA+A7fRZRQLBTjMt2rwwVDMahindkrwGS9DiZbX/H38
 Y1d4PRwGQdrnYTFgEIGYpPhmKsSR+iy+Ma7vdsZpY5O+UoVmG4Qi+dec6ZF29Uvm
 Bcqb7b5C6iyUguMVeQECLeHLjbsZLJL8DDOvdG7Y1Lalf/1GFR+UXxW2BpOf9uoI
 CCQo/w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n41nu8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 20:52:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-9205e6b0bcaso599169385a.1
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 13:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782161561; x=1782766361; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q04zAzd67z3/qNYdFwffqoykOLV8m1yykTVeARIonOI=;
 b=CAG90aN45KHIv0zhM9NnmiAjkt4tpqZu31WRDi6CVfdKa357M2SiLuH4NcJsWqFkJk
 Aaxxs24eRp6N03d2lk8jLsZYRIa1SUqVqlh+p9yrh0JeYf0uswWpY7Q9hQJCWGN5bZLD
 vF2R1hCjy/jed5EX1wa98tRp0Ev28xUXKTay6RZSS1tt61R0IJvNvY0pSfYbN+AUGgvb
 Q5Haw5NY4rL+DCLIRYrPguYacAgOsvE5TDQCFaMETXuhjSazzmCxCprCsfc3R1pPXO98
 Mo0lUC5eKvEcjnGltTmWclTivckDISX1IrQVFcqG6JMo5s1RwWJPVgoQszFYY9bc7VeS
 GZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782161561; x=1782766361;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q04zAzd67z3/qNYdFwffqoykOLV8m1yykTVeARIonOI=;
 b=AmxaBnL3gbHhIf8PYzCNMk0sf0IC81Xkrz3Mp6mJLX606/PomftWGBfmoedvVvwN9T
 PNDrE7JHfg6rSSsRkZDEBmooU3paPh1GUUlXH0bfKEsblIyVoEr3/V0p44HLWcTrjPNb
 kIyy0WeVVzm29lLM6UZdMm/csMfIqfT1cYMcytR6cbCXw03KFEYpR0ic7WsBlN3abI5y
 3Zvwc6DZPEf2VS++RGXxIPIcNb16+FkLOl0J+nhj19P7s2ypBGW+V5NZi9dgSVNyDfwk
 ygGcDYutM1/c3jQBh5ksS++KjStGtiz4vmeDv/NLY1y9j/TyDbjNke5W/PTTU+a+eRTt
 M0xQ==
X-Gm-Message-State: AOJu0YzTNjEHjHyRMcYGNmVHrlAq0rmO4ReW41Pi7Yin4v9hmaj8348W
 3UL7jVVoffdMFRtC7n4oQYjkmhyQtdxX7gn0V7IlNyWm3fVtwXnw9Fif2UEnn87sY28traNKMN9
 FBs9LFM8AFxM1B8fzw62YKgQWh8+OjVVlZRDXg9CJ40y1uOSgxJVKbEBEYg==
X-Gm-Gg: AfdE7cltCGggKPEbnoAeMGSEikzt5+iqdiTLEQTwFW9MXW7PuKV1ltH2kcTY/fRokQv
 KvDkY185EosTr5UpEr+ERITyEeOFejXheS3J3dLC4XtLQw7IqeTv54v9+LZYnkIJzEZt9fD2yJG
 95u6z97g4OzSSLrKkEQHV8oGoVHq+Z5C2fDJ2J15L/qKkrc0Nc7OmPabdWFYANaWYHUkOdZB0/c
 srU32+9dgeQ/h9QU5l/ZBXAOed2oofUwRnpRuasqg4IkJGmz2tlidE+AMYRXF/k48gsVkRSKnz+
 DpPjLk+lrW6fiR6NBxnD54WCDCyWDxHed00NkRxOOGFlZwRtOodjTBlo5oJrsv757i103yco82Q
 cNNPnkLWJ/TA4M3AOxkLJ0eiISqpwhezxr0lD2LrBbAn/i22VAyx7EERH1C/ZQQ==
X-Received: by 2002:a05:620a:4455:b0:915:aa7d:42c4 with SMTP id
 af79cd13be357-9208e498886mr2686121985a.8.1782161561397; 
 Mon, 22 Jun 2026 13:52:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4455:b0:915:aa7d:42c4 with SMTP id
 af79cd13be357-9208e498886mr2686115185a.8.1782161560838; 
 Mon, 22 Jun 2026 13:52:40 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492494497ffsm248540445e9.11.2026.06.22.13.52.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 13:52:40 -0700 (PDT)
Message-ID: <dbb31523-ab2a-4786-b0ff-f3e70968bef4@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 22:52:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/24] target/riscv: move TCG only files to tcg subdir
Content-Language: en-US
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
 <20260622193141.1449724-3-daniel.barboza@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260622193141.1449724-3-daniel.barboza@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDIwMSBTYWx0ZWRfX1yyO3xWDYumH
 NL0OA794nNaETJLa8P3nLe5JY8MF+CZWl3xReeNAzgPWtO6Wbo2stmSPuf0FtJCNhEvDCaYO/vx
 SWusovlCxpDvQrkHfQ8JqkiWJVNI99g=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a39a09a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=YMcZpqoK_VanQ7R3mqAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: HcDzRxjeW6ZHFNoeJPmzkPdrWSr-5Rhd
X-Proofpoint-GUID: HcDzRxjeW6ZHFNoeJPmzkPdrWSr-5Rhd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDIwMSBTYWx0ZWRfX6ZEAuaS64c0C
 vNAJe2Ey43rRWOERTbiJ9h0dJtRLe7jh2/vwtvFtyALoQLHDXM3LteKFyvbjPPQuru0tm4mbuEq
 8jzVlEqHqFzKmJbg3nKAuLbXTb6NRAjcRDe+8LO2UcO37r1gOuHfujEJ6FlHs1IHBH8rCe4vT3W
 P0liq6AYSPG3PfDGlEnbm6ycGKUu/18zYmQFy9W3t9tS5R/8lEPiU6dtvWdwvU3pE0A2PC36sRq
 ybFHjP000MRiD7iipTGkTvkbMXOjuRQF1iurClH2m5gUSO4cBUC8GrVB8kZaN1h+m0MWrn7iJPz
 /EGbmPKBmOdLrfCVn1/YrD4793cNKOGxsVCl8R/JefrFPuZZfGgSDBmCYtDg9ZpqrOd8FuoOEWN
 Q3dgtOfamm/qX/6mNe4mNRgvD+jHbPchy+uzhWGHqpy72weC6nydqFBANmwSyRJXDHc7ThhM6vK
 yiFrwreA6s/pQogSTwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_04,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220201
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

On 22/6/26 21:31, Daniel Henrique Barboza wrote:
> We have *way* too much TCG-only code hanging around in target/riscv,
> where ideally we would have things that are shared between accelerators.
> 
> We'll follow the example of other targets like i386 and loongarch and
> move everything to the tcg subir.  This will not only cleanup target/riscv
> but it will also expose what is common code but it's buried inside a TCG
> helper.
> 
> We're leaving some stuff behind because these require a little more
> case to not end up breaking KVM.  We'll take care of them next.
> 
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>   target/riscv/meson.build                      | 16 ----------
>   target/riscv/{ => tcg}/bitmanip_helper.c      |  0
>   target/riscv/{ => tcg}/cpu_helper.c           |  0
>   target/riscv/{ => tcg}/crypto_helper.c        |  0
>   target/riscv/{ => tcg}/csr.c                  |  0
>   target/riscv/{ => tcg}/debug.c                |  0
>   target/riscv/{ => tcg}/fpu_helper.c           |  0
>   .../insn_trans/trans_privileged.c.inc         |  0
>   .../{ => tcg}/insn_trans/trans_rva.c.inc      |  0
>   .../{ => tcg}/insn_trans/trans_rvb.c.inc      |  0
>   .../{ => tcg}/insn_trans/trans_rvbf16.c.inc   |  0
>   .../{ => tcg}/insn_trans/trans_rvd.c.inc      |  0
>   .../{ => tcg}/insn_trans/trans_rvf.c.inc      |  0
>   .../{ => tcg}/insn_trans/trans_rvh.c.inc      |  0
>   .../{ => tcg}/insn_trans/trans_rvi.c.inc      |  0
>   .../{ => tcg}/insn_trans/trans_rvk.c.inc      |  0
>   .../{ => tcg}/insn_trans/trans_rvm.c.inc      |  0
>   .../{ => tcg}/insn_trans/trans_rvv.c.inc      |  0
>   .../{ => tcg}/insn_trans/trans_rvvk.c.inc     |  0
>   .../{ => tcg}/insn_trans/trans_rvzabha.c.inc  |  0
>   .../{ => tcg}/insn_trans/trans_rvzacas.c.inc  |  0
>   .../{ => tcg}/insn_trans/trans_rvzalasr.c.inc |  0
>   .../{ => tcg}/insn_trans/trans_rvzawrs.c.inc  |  0
>   .../{ => tcg}/insn_trans/trans_rvzce.c.inc    |  0
>   .../{ => tcg}/insn_trans/trans_rvzcmop.c.inc  |  0
>   .../{ => tcg}/insn_trans/trans_rvzfa.c.inc    |  0
>   .../{ => tcg}/insn_trans/trans_rvzfh.c.inc    |  0
>   .../{ => tcg}/insn_trans/trans_rvzicbo.c.inc  |  0
>   .../insn_trans/trans_rvzicfiss.c.inc          |  0
>   .../{ => tcg}/insn_trans/trans_rvzicond.c.inc |  0
>   .../{ => tcg}/insn_trans/trans_rvzimop.c.inc  |  0
>   .../{ => tcg}/insn_trans/trans_svinval.c.inc  |  0
>   .../{ => tcg}/insn_trans/trans_xlrbr.c.inc    |  0
>   .../{ => tcg}/insn_trans/trans_xmips.c.inc    |  0
>   .../{ => tcg}/insn_trans/trans_xthead.c.inc   |  0
>   .../insn_trans/trans_xventanacondops.c.inc    |  0
>   .../{ => tcg}/insn_trans/trans_zilsd.c.inc    |  0
>   target/riscv/{ => tcg}/m128_helper.c          |  0
>   target/riscv/tcg/meson.build                  | 30 +++++++++++++++++--
>   target/riscv/{ => tcg}/mips_csr.c             |  0
>   target/riscv/{ => tcg}/op_helper.c            |  0
>   target/riscv/{ => tcg}/pmu.c                  |  0
>   target/riscv/{ => tcg}/th_csr.c               |  0
>   target/riscv/{ => tcg}/translate.c            |  0
>   target/riscv/{ => tcg}/vcrypto_helper.c       |  0
>   target/riscv/{ => tcg}/vector_helper.c        |  0
>   target/riscv/{ => tcg}/vector_internals.c     |  0
>   target/riscv/{ => tcg}/vector_internals.h     |  0
>   target/riscv/{ => tcg}/zce_helper.c           |  0
>   49 files changed, 28 insertions(+), 18 deletions(-)
>   rename target/riscv/{ => tcg}/bitmanip_helper.c (100%)
>   rename target/riscv/{ => tcg}/cpu_helper.c (100%)
>   rename target/riscv/{ => tcg}/crypto_helper.c (100%)
>   rename target/riscv/{ => tcg}/csr.c (100%)
>   rename target/riscv/{ => tcg}/debug.c (100%)
>   rename target/riscv/{ => tcg}/fpu_helper.c (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_privileged.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_rva.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_rvb.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_rvbf16.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_rvd.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_rvf.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_rvh.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_rvi.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_rvk.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_rvm.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_rvv.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_rvvk.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_rvzabha.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_rvzacas.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_rvzalasr.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_rvzawrs.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_rvzce.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_rvzcmop.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_rvzfa.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_rvzfh.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_rvzicbo.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_rvzicfiss.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_rvzicond.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_rvzimop.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_svinval.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_xlrbr.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_xmips.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_xthead.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_xventanacondops.c.inc (100%)
>   rename target/riscv/{ => tcg}/insn_trans/trans_zilsd.c.inc (100%)
>   rename target/riscv/{ => tcg}/m128_helper.c (100%)
>   rename target/riscv/{ => tcg}/mips_csr.c (100%)
>   rename target/riscv/{ => tcg}/op_helper.c (100%)
>   rename target/riscv/{ => tcg}/pmu.c (100%)
>   rename target/riscv/{ => tcg}/th_csr.c (100%)
>   rename target/riscv/{ => tcg}/translate.c (100%)
>   rename target/riscv/{ => tcg}/vcrypto_helper.c (100%)
>   rename target/riscv/{ => tcg}/vector_helper.c (100%)
>   rename target/riscv/{ => tcg}/vector_internals.c (100%)
>   rename target/riscv/{ => tcg}/vector_internals.h (100%)
>   rename target/riscv/{ => tcg}/zce_helper.c (100%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

