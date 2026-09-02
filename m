Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAFCC624D4
	for <qemu-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 21:33:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1sa6-00044l-Dp; Wed, 02 Sep 2026 17:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1sa5-000448-1l
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 17:33:17 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1sa3-0005NM-Ga
 for qemu-riscv@nongnu.org; Wed, 02 Sep 2026 17:33:16 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 682KH8Eb2417702
 for <qemu-riscv@nongnu.org>; Wed, 2 Sep 2026 21:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1AzF/G6MbNuoFX4LgFQThFcdelHfAq7h2AQYlrfTcPM=; b=V7L/883XSeo1ocHB
 d704aqK3oSs7cKVLHuTAnYJHUIinQlvaSr1TSQbto0Of/FwgDZ2E5JjMvF1WHdW0
 9TWeBbz/lAq8YZBrVzZsd2JVBkBrJ0xqdvbMWszBxqw1D11+15IjA3l3qBzvI7m/
 eZqKZQmp5ofxnfsllIhtZeiG36S4ObSv9HlaXbBzCEgUxkrJS/3BSBA3/WMIAzXi
 zJ44UxA4KgaOaTSUWTkklcWFW2zmKy9eDgTa9I2ipiKvlenIYJbRfi7YzayYzHCI
 UNtqaL58Pfg+Tw8O62usz/CB8okz2yTAjaFpiTmhr0lQQqpQ8j1NkwCA0eZGVn8q
 Xls2KQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdstb7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 21:33:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-936aa34873bso251735285a.3
 for <qemu-riscv@nongnu.org>; Wed, 02 Sep 2026 14:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788384793; x=1788989593; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=1AzF/G6MbNuoFX4LgFQThFcdelHfAq7h2AQYlrfTcPM=;
 b=CUXLNmqejN//rRzx+2Jkx9GdpMCABBW9PuxQo+UxAD2uRT9S2/FEPLt0e4ph9jCQY2
 qMUKNQrPIMuz9crDMbo4WlkfaSkuCdeEyPAKuT/+tLRbNiRnWejjL4ySTFRhSfDJJMja
 8PTZf9gyn0+Yn7t7HEq9LapWhorGDKyKkkQr7IkzWoDgcMCaUZNama6xcGp4lwtwqqH9
 zuPBVCEQ9RpaoV1bjJtayEPvMLenRRLrAEnHjYwHq1kgnl58kGF1yZrqQUH8IkVmwZoY
 1mK6B2pusF6/TNcG2xeROSP9GYb66A62cugBqj2WitFrCvIT00myeP19sDqIA7UFy7JG
 pwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788384793; x=1788989593;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1AzF/G6MbNuoFX4LgFQThFcdelHfAq7h2AQYlrfTcPM=;
 b=qb+nLdTpDd58x8mYy7PSOiSkP+rlNAj/Tp/HU2VrDap4D7rlS1E+i/e2dSd0QSXu9i
 TeoUfi6LSoxwgPK9kafmgiN0RVEeswsglz5uIEirZEBjxgLks8ABcKgsl6wIciX+M1hx
 clF4fH/XZ4yHTXoM5CCm3xLvHsCtJggJSe43SV9rxl85hCkpVlkHPkxywgHHsEcLwIkK
 LSK05ceOdet1cKOALvJRukZNpV2XNahd4/ffTUBXGZVesbq5++EjeWCqOauXqXIVWeK+
 Jva4wIevDX9GiNq9pszTqoIQCqG7SsDO4zsu03gLz9wozz4Ri0M25ochKBNwguK4u2T+
 f1uw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzkd2zkdEiBirKViEj+CerYSCGZADEszORbzzn6JbJaieFXln+wheYzXYOqQX8jEJlqxSQQ6rttF7iu@nongnu.org
X-Gm-Message-State: AFuF++mndWGjNCdLqs0P77w3rM3m+K+pW2TWUasBGTv7VJqI0/KIlZUu
 XXasac6vhboHMZ71rwhbwKuLaMxAKRKbmMnoNuNPsZO5/D3gkE2TP/7rxIfV8udeftigjfckUYi
 0GSKPhX+A204ZtPgukAKJJPd4IVeOSlmLAZ1ZXu8T9WTfsGmJWae2cI+kvA==
X-Gm-Gg: AYBFou09DjON+jiNZxiA9oTy73PkXjeVwTVyTYzxm9jP/Mbbk/eIx9yaEytmI7uWvU7
 mRgNOXRszy8hvbyPTUbbr09PcBdh5P8KpWBpEqQ1xVJarhTZKro7pqLP619Re4U1kE+KY9K5w9s
 mAD6JQjdmNCdIUgn//Jc58pLVz4k2J3547ThVhUrbuN5A5Co4hJJiefbuEWCgeRjVS3T6n8idn1
 ayPdXKkdMkCyY3MzpROfnI9n5qDy6ARTis8oa0W71BO7Ij9JFQQWg/kFvoFEb1je2/0GGm5QDld
 +GEWaz1G62Etg06Ar9EkhfY1mHQzCEPoRXG8wsvjCrOUUShQOkxfzw2hDhfcCLyDoouRBZPEmqU
 3mBI1lq1/05J90lq3/7NmLybGhTKyIPzdKg==
X-Received: by 2002:a05:620a:47b6:b0:936:576e:227b with SMTP id
 af79cd13be357-93960f3c98amr816836285a.24.1788384793497; 
 Wed, 02 Sep 2026 14:33:13 -0700 (PDT)
X-Received: by 2002:a05:620a:47b6:b0:936:576e:227b with SMTP id
 af79cd13be357-93960f3c98amr816832185a.24.1788384793023; 
 Wed, 02 Sep 2026 14:33:13 -0700 (PDT)
Received: from [192.168.69.200] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448eea5b4sm9107237f8f.27.2026.09.02.14.33.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 14:33:11 -0700 (PDT)
Message-ID: <97aa231e-a3b9-4558-bf62-248f0a751c10@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 23:33:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] hw/riscv/k230: Attach a standard SPI NOR flash
Content-Language: en-US
To: Kangjie Huang <flamboyant.h.01@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Portia Stephens <portias@oss.tenstorrent.com>,
 Bin Meng <bmeng.cn@gmail.com>, Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
References: <20260831-t_v4_spi_patch-v4-0-370d416f26b5@gmail.com>
 <20260831-t_v4_spi_patch-v4-3-370d416f26b5@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260831-t_v4_spi_patch-v4-3-370d416f26b5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a98961a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=VD9ueEoDFE-sBf3Wn70A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: kJYJaoaDstxT6mlbNxjAvIFH-5bw1OjZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE5MCBTYWx0ZWRfX5pM90kfkS84Y
 Sxd/MeIpIvXeaMdKVaxSlBf6s3sOswGXXHF7OOAlqAZPyS6MhIfsB+h5k30uFWPhh5WCadynZXp
 STRHHjxyel/UhhDVMGDWcf2Edu+ZNDb6eo5hZiU6G4/zfHOy6wKt3stMSXIJuue++osST8TE8au
 +dTsx+PfcKZvpzMLN4b7Vx0eJvbzGCrk4Q/YYAiZtiSuYnBjH7Vq7jTAha1TuY5nGClJOTJqW0B
 +dnjI2iaA5iFoYN2jDX/yqDbxB2Laf8vNkW2nNF0xeFvXOX9Zm+Xjv8K8p8YebydbY0UL6b3iyp
 fBYxz7/Fvsbp2Ngsqt7Lgs8Y4QAxslVNkpQTNezuf86JS3YIuJtWcpNnVU4j6yXnfoOYUo0pBr0
 5vvU/vCTeU+11r4BWm+K0N2lB+ca+Gm9dvHxCijAZK62Pp4v2iSFFsxKfu28uagEhKXgvevbc+N
 GuUlzs0j/v4AZDHc9TQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE5MCBTYWx0ZWRfX2Kf7Pg/weVGC
 vAsOetpIbI6gJiufVV1Z8hVF8UJyCmJx+jP7WpBy/qWZfZ8RGjBBPQRZ9WDfO1mHZEZzW5taLj6
 Zrd7NnsbPBqX/DTDOIxxF49YEvQpg9A=
X-Proofpoint-ORIG-GUID: kJYJaoaDstxT6mlbNxjAvIFH-5bw1OjZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020190
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

Hi Kangjie,

On 31/8/26 13:11, Kangjie Huang wrote:
> Add an optional `spi-flash` machine property and attach the selected
> M25P80-compatible flash device to logical spi0 CS0.
> 
> Add qtests covering the Standard 1-1-1 JEDEC ID read, a read at a fixed
> address, and an EEPROM read with a multi-byte command and a non-zero
> address.
> 
> Standard 1-1-1 transfers against the attached flash were also manually
> verified through the U-Boot and Linux SPI paths of the K230 SDK.
> 
> Enhanced SPI, IDMA and XIP paths are out of scope for this series.
> 
> Signed-off-by: Kangjie Huang <flamboyant.h.01@gmail.com>
> ---
>   docs/system/riscv/k230.rst      |  1 +
>   hw/riscv/Kconfig                |  1 +
>   hw/riscv/k230.c                 | 66 ++++++++++++++++++++++++++++++++
>   include/hw/riscv/k230.h         |  2 +
>   tests/qtest/k230-dwc-ssi-test.c | 83 +++++++++++++++++++++++++++++++++++++++++
>   5 files changed, 153 insertions(+)


> diff --git a/tests/qtest/k230-dwc-ssi-test.c b/tests/qtest/k230-dwc-ssi-test.c
> index 42e3190cb4..a0ec580679 100644
> --- a/tests/qtest/k230-dwc-ssi-test.c
> +++ b/tests/qtest/k230-dwc-ssi-test.c
> @@ -80,6 +80,7 @@
>   #define K230_SSI_XIP_MODE_BITS          0x0fc
>   
>   #define K230_SSI_FIFO_DEPTH             256
> +#define K230_SSI_FLASH_SIZE              MiB

Less confuse as:

   #define K230_SSI_FLASH_SIZE              (1 * MiB)

