Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B225BC61DBD
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 18:12:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzI7G-0002sW-Bx; Wed, 26 Aug 2026 14:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzI7E-0002s3-Io
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 14:12:48 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzI7D-0004ir-4u
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 14:12:48 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QGuk1K1408930
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 18:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Njo29Y3Aoc1x+z1mPXeK6T4tR9PoICiU2RZ8beUT3Ew=; b=K21TTc7PdJYohWF0
 6K3KYMUbASsrMNlSWvxC1mFS5Oa85uD67QUjuRgsSYtNwBxMWNePIYUkBf84A+es
 m/VtrGvVjse6HT/qOkoVw6pO83oQ3mPTma/jqnOKAF7OPymFTbzcZPTi/4qdYucF
 RfPURa3BB4uIHc5g7rH6Xx8WLSUn+gnFemVl2Ktf3YOGdk3MY/HDRnv0jTOrKxvr
 KV/PiYE/mjP2dt/mGUQMsbD7huNNfnsQouheesq4VzkUdp5C+rhwU/TH+JCWMVnl
 Hqh2P6Vw0ULLKfdABW2uiXSOIovbqSbw27rAmgunQvAmkMuYwUTPtpQtLidMZJHq
 loNRtw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9x2n1wh8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 18:12:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c1d137a68so23480811cf.3
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 11:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787767965; x=1788372765; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Njo29Y3Aoc1x+z1mPXeK6T4tR9PoICiU2RZ8beUT3Ew=;
 b=RRVnyfy0go3xFhT86Hl9JhJPSy9s4ZzZRhJNk2S59yS2Z4gc7ERfJkLvyFgdsWcRx2
 wokpH1paB/LHVcPZatH5NpzQ+rf9hYQMcK5mJEPVy3xRUmluGVSIMfFh8t13ITnk8KRB
 mJeLUnn6dsQpv2zwkstdc3StPUpN02/dJpQywks424/ukJbw+nwRES0dJkpuVm/0LRA5
 3HqyP3ZY0WHwH628IHCW73XanKAgH7UtnxdO1OjyHiyg9VX/jcbO4xam0q9IpguxEAB1
 deZgQKKFP+PZ4mUext/Kwds9CRl8qUaoCztO+7BLbA65gphjPy8N0IqJI+tj721zjihu
 bcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787767965; x=1788372765;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Njo29Y3Aoc1x+z1mPXeK6T4tR9PoICiU2RZ8beUT3Ew=;
 b=HPyGWv13zGeEQc4gKNk2IzD8MU+2i3Ea9/Ke7PwDKQPsA5LQiULSewMliz77ka/NWS
 5jMYakFwDSNzX3Nqpqq+CoFqSp2WNWecBN7bPGuvhoVJL7N6S9yCr64NyMb0H0QAgSvD
 AVfd61VU5LjVfeDaJAwLZRVomvc0fUr9/s4TWNGQWdeAbI4ZgX83xrWMKkpjUiqp1nWd
 PMLlJxNk488LPPZEvYSEV177fyp8mnjkAp/SnJ0u89NKx4qvdPJ6tuDS2P3aHpsTDfNG
 ZkSmKKxqw0PFbAjvyyd8/DhKBdBqULOmsreZbrSD+gIBqm8lBSJXv357SitPKBtPwTLp
 XZNQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoTn7hKu8Foxv3jkugc74nPXxajhWxr1RiA8ty+M2kaqM7lMyWXof1cZwh/e/+1e/goASdmnNKUG2KM@nongnu.org
X-Gm-Message-State: AFuF++ksk/rg/GDj43MXHiBEOXxTFznHJ0/APW80d1gdIYjkjT5rvJzW
 DR4iuyKOtsrZ4uD8uZROXBZ6L2XRJXx8ISb5MNtw+CxT1NKMhIZbX61+8A/uw+IqVN4/5kQLXuw
 XSsJnr3AYnJNbH3x4fbi1BPicyN9mZZfTza8U965xLed1u5XGyTUWhfZ9d852ZK1Xvw==
X-Gm-Gg: AR+sD11kLGW86wmeaqh290nmGuGOKAFRf+Knd+2zL1R0EE840ptgsIqaiI+45sfIUS6
 e9TJNscjAlZAN2DzD1/5YNsPpjzQRVFHO5vP/2xJTfkQ9EIlcHvoEnw+Kk34yZa2YJJNHndnwnC
 AoQ94s9beaUQaqTB4RevbtCgX0wPSANGMGGNIDsgpJnnwUkyaZ+hJah7sXicp1vaku99ISW+qz3
 h3QAsJkE/NgDhzUqK7+m4btxgo7arohC7NGDJRPgbW3p5Flbwrkemt2Rxha+NhBmpZS431/u44V
 8ggHag5J9gSBWX9p6qaFZhHFAfhxz26S2U+E8nPMGVfxTVGVs/xGuwTCH9YXV8mSR79MfowTz93
 BE//OgGxswvk3kB29ocaHKD07f0iitJgalEHl
X-Received: by 2002:a05:622a:4815:b0:51c:61a:50fa with SMTP id
 d75a77b69052e-52e42472cd1mr101604721cf.39.1787767965044; 
 Wed, 26 Aug 2026 11:12:45 -0700 (PDT)
X-Received: by 2002:a05:622a:4815:b0:51c:61a:50fa with SMTP id
 d75a77b69052e-52e42472cd1mr101603881cf.39.1787767964524; 
 Wed, 26 Aug 2026 11:12:44 -0700 (PDT)
Received: from [192.168.68.100] ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90cd052c5e1sm12906096d6.24.2026.08.26.11.12.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 11:12:44 -0700 (PDT)
Message-ID: <6a2417bc-4508-49e5-baad-636ffebf6968@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:12:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/13] hw/riscv/fdt-common, virt.c: add
 create_fdt_flash()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20260826164814.44335-1-daniel.barboza@oss.qualcomm.com>
 <20260826164814.44335-2-daniel.barboza@oss.qualcomm.com>
 <a434a0e7-f603-470a-973c-c1e3334ea200@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a434a0e7-f603-470a-973c-c1e3334ea200@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fcanMGiR5GgXmTkz9P3QSp6IhyyiwyMP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE1MiBTYWx0ZWRfX8K/SPcJTK2LN
 1mZiy8veWjEkTgbqzyRoOieUyl3fOS/e1Doa+sVq4qIS9zbC3VuoT/cfc17ILCfyZSRCMZgG8JR
 6h1E0HsUPnuCmuJ3Klfc0V9mrsbxsmo=
X-Proofpoint-GUID: fcanMGiR5GgXmTkz9P3QSp6IhyyiwyMP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE1MiBTYWx0ZWRfX0Mqs8gXqLBKK
 /gq+TFGE6skJ8r6n2D+uaqvBH4SPsRXG7C2ObuGUt9219mh3VD1c5xzcbUpCfCVnX7Tbw64B1sg
 /XNhOwGuxHFcQFa1p+orSECX/Z1FEwCcOwFLw35DzhPlxGJlsrId0+mJPA1TBfcrjmfMJJYK0aF
 oUtTPanXCT056dAkmm3+URZowD8Rynq2ZF3zbN4H3ZTV1DGUBTOzaDMHBMVzhVTuLlbxoM1acVA
 KJixLjHPNg+oY3qj0OSP6n6PYHFaSMxPYEnG7bslmD2BIBiUP8ts+ZeNqIUEm9ceT7bDVIxCnn+
 OL4OFr+FZQgqc44PZKCXC3zu4TGKi2L4Zsmv7swzzTWEidACTvw4M2Cxzjx7Ngnwb3aAMbHPsbd
 Y9GirthjUBe+NM76nTZXIb442S2SK7rVmwErDEIXuIm91r2Dsz7OS+roYSQlHneeEScCmKX2pWM
 sfDdPeXosgGQ2dtSooA==
X-Authority-Analysis: v=2.4 cv=PPQ/P/qC c=1 sm=1 tr=0 ts=6a8f2c9d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=uCxL1PNzozBmIZ4riZkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260152
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 8/26/2026 2:06 PM, Philippe Mathieu-Daudé wrote:
> On 26/8/26 18:48, Daniel Henrique Barboza wrote:
>> Add a common helper to create a cfi-flash compatible flash subnode.
>>
>> This change only affects the existing 'virt' board for now but it will
>> be used by the future 'riscv-server-ref' board in the future.
>>
>> No FDT changes intended.
>>
>> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>> ---
>>   hw/riscv/fdt-common.c         | 12 ++++++++++++
>>   hw/riscv/virt.c               | 18 ++----------------
>>   include/hw/riscv/fdt-common.h |  1 +
>>   3 files changed, 15 insertions(+), 16 deletions(-)
> 
> 
>> diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.h
>> index 1729a6abc6..6e438e0278 100644
>> --- a/include/hw/riscv/fdt-common.h
>> +++ b/include/hw/riscv/fdt-common.h
>> @@ -36,4 +36,5 @@ void create_fdt_plic(void *fdt, hwaddr addr, uint64_t size,
>>                        uint32_t cells_size, uint32_t ndev_sources,
>>                        bool numa_enabled, int socket);
>>   void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_name);
>> +void create_fdt_flash(void *fdt, hwaddr flashbase, hwaddr flashsize);
> 
> Generic comment for the whole series, if you make this API public then
> please prefix with 'riscv_' to avoid name clashes when linking with
> distinct targets in the future.

Oh .... guess I'll add a pre patch to prepend the existing helpers with "riscv_"
then.

I'll do a v3.  Thx,

Daniel

> 
>>   #endif
> 


