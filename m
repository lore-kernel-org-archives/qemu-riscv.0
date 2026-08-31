Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0171C61DD3
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 05:09:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x0uH4-0008Eq-TG; Mon, 31 Aug 2026 01:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0uH4-0008Ea-14
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 01:09:38 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0uH2-0006yE-AK
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 01:09:37 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67V52NvX3678759
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 05:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3LfAFSU45L6bzpVuqkGeWt1+pCwdVEsno7bo/Wg5E8A=; b=VZGK/xvH5nwjEiiz
 QQGxyjsZqf6WDauPzSFtJAukiD1GcgQkpSYWfQhw3NjFIGWj1LzaExlRrlPeRwV9
 2DuOmgRRReFbPH6/WvVMuNonixIcRGTz4fiJ5U5GXInSxCZUxa/I8ksGykt/1Kp3
 zFJl0oKw4Cw2D/Zk5k76zQI/nzYSTlumYjkY5LYISOXvqjqLExD4LohzVnN6qHMk
 KqubByPzXqs+FqwdvxRSEZEIUiwexScHTokVwnOkjnqALUUQB5oi6g7/HypcH5eQ
 JErGresVXLtkhlYSenYM6hVrMTJJrds7ncly2XQPJsWRYWxln007JDcfHYGyU/lq
 FXry/A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv8h0wn7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 31 Aug 2026 05:09:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-936aa34873bso392376185a.3
 for <qemu-riscv@nongnu.org>; Sun, 30 Aug 2026 22:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788152973; x=1788757773; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3LfAFSU45L6bzpVuqkGeWt1+pCwdVEsno7bo/Wg5E8A=;
 b=OEdxFp8u7FueKfQ0TfEgz3fo0Ws38CZ9FYyOjyG1/PesjvaC6qIZ4LPkWsDszzygdj
 Nr/11UiG/y+NrES7pkiEEY0WKzm8kByRmILA2wYTueiKFY2kQCZA6ts6W7yc2K/01u+0
 fz08ZDHfVNrgfBNiO+tk+GQWWiAj8dXaQCiUUmqIbVcmqspsMquVVGLtDyiiXBgJs5YD
 l6tSjfGk9BsP5lnp2aAazpas9JL9v2DfIAFaCmx98RWAeMAY+97OgnqRj85G/VeDKH0N
 fAsB6w+QwkMx3PJVnJGWP2EYZhusfbWoZyPAEeu5x8hLEagI/zM0l/fwuii84TeYd4GP
 6xTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788152973; x=1788757773;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3LfAFSU45L6bzpVuqkGeWt1+pCwdVEsno7bo/Wg5E8A=;
 b=RhWXiNgOfD5V7JnmJ2r8b+E5XRn5+Kq0DyeSZSgltMu2XQZ0dXZLGJir3/gPB7Zrhd
 p9T/6gdmuvTR+dbm2RFarAImbSeGJrFIVYqsTUgSmkgdVDeMR6eDdGmuoJPwlWYbqcfe
 S0C3XY78XaCMZALsQHpy7eAoi1hzROReXdGFCDOLto7M+muqtknW+oHCUKefw2QvyRrd
 JoP6AM+w5yAv48I1xNvn/6pEPk6gmpvwQ5tEQ+fgxckqGx8DmnvjpoV7CSLSGz8bqbDx
 QuX9DGbMpJA2I7sE/Ijuuff9muOsjmouc/a6CIs4ujF2fYhRP30IpvoJTty7RdiigMBL
 Kd3Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RqUW4bimRPGm4mH8wZDv6oshc/9f/B2CYgZlPjwax1rM7O/lyRlfgq1wCGX37qrfl7xASZmEYfnxJ0a@nongnu.org
X-Gm-Message-State: AFuF++lb9pBowTNZ2Hs+igiqZzv0OqUFzV63rLVsdZTX3+3C4Cg4o8Me
 Pz3UvnFUBUC+Kht8gAOW3WKtsxDy32jDwBQzcBACddXzO+Ud8NuGt8CDSk3IDrAeC+cQHyFYFCr
 3cRcvosTDhvHY+SCMSWgL3Sc2BRJwVwX1F2yGiWGjBPRqRTH9SEivPLV6gw==
X-Gm-Gg: AR+sD13mZkEBPiCy0Jacahtx7fO9/aC/2GPL+ySvKjVa/OM0Li2SprUYR2q+0cEki8C
 GIaNu9ihMcdyuVxV4DqVeetC60aTtDeR8CmY/TFZHqVrS8VuQd6xJrfBcvr8N9DE37aBeI3fmcp
 HG614p7fW44UfC/bY7Yln/iaAwMwtGABZmiLTuzJKr0nvkj2lO5xSIOlrqXb0dpodwakYcuZvTP
 WXsasbvtcezKNSrEr44N39MHKz/SXwUPd5NmhL0swtTqWCNFoAMvLIcXprBfAz0/l9G7QNNyGx3
 8vNOEVnyl+7sAODnk+O9WLGz8i9lQRklZ7bnJJPclxJRMI3WeYXwPDtOGOaAV3Y1rAo7vsDSj+C
 WWbC1jHy4dtK/Zgg2Fs8x5Np/tPqWYv/43g==
X-Received: by 2002:a05:620a:44d3:b0:936:b923:4828 with SMTP id
 af79cd13be357-93913955094mr2281623285a.31.1788152973219; 
 Sun, 30 Aug 2026 22:09:33 -0700 (PDT)
X-Received: by 2002:a05:620a:44d3:b0:936:b923:4828 with SMTP id
 af79cd13be357-93913955094mr2281619285a.31.1788152972706; 
 Sun, 30 Aug 2026 22:09:32 -0700 (PDT)
Received: from [192.168.69.226] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b91c9cf95sm198941615e9.1.2026.08.30.22.09.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2026 22:09:31 -0700 (PDT)
Message-ID: <31930483-ac52-46e4-971b-9230efddf580@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 07:09:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] hw/riscv/atlantis: Make UART unimp region a SoC
 device
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20260831021500.82565-1-joel@jms.id.au>
 <20260831021500.82565-8-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260831021500.82565-8-joel@jms.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DY0nbPtW c=1 sm=1 tr=0 ts=6a950c8e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kD1aHXNoiUmW-fgF_RsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA0MiBTYWx0ZWRfX92Pn+ZFYw8g2
 FeblG5hbhUo6RBb641MEAk9KolBjBDhLqhH4AH+/fmFgO6yYAP9OLk6J7Hnyt/8JFvIQuV7q0ng
 AodF0KeRsNuVBtvENSbXE5/+m5CqVxdBXaYI7mKMQu+D3B2rJPh5m/lu4kLUlug4Ak8MkSAQ33W
 9yGRJhH4sxuaVJs7N/TTCnCjNNrRjgSbLKxBmePdhIwzRt8MGzYoHEHS+3XmaZlgpqnd9yP1EQd
 tSe3kngmQks2m2CFt1M95z8zr69isMejxyB9BCwho8Ag8C8UXHF3rnKVFKJoUDj3WmN+Fo2brtU
 /wnmkxxUO0PdD79Nfw8R7iSiECiqFfH89OJ4n3zbWeVk5paxqBOoUSGS11luDDvi2bHqgbvluZF
 FB46/PRBom2SlnuwRwXSJNq6RGeNq31n1ni5C0O0nACBNRiVMFRAqgg62jCMwiVDuy7r8H7tXU1
 n6oR4i+awEdNOYAiBsQ==
X-Proofpoint-ORIG-GUID: 03rIqruUIYpE8C-mcl3vTW400TX_QHQG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA0MiBTYWx0ZWRfX+2pPoTTsV1yi
 BzhduqXb3HEoeqdk6GHzB8ONB0h4eH0OoCf2didMSr8brDTHRJQKhCnY9rji/Kz0bYqPrQGzC1Q
 4Ori5wn35rf9I8+telKDyrtej0Mj7vE=
X-Proofpoint-GUID: 03rIqruUIYpE8C-mcl3vTW400TX_QHQG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310042
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 31/8/26 04:14, Joel Stanley wrote:
> Make the unimplemented region covering the remainder of the console
> UART's register space a SoC child device, mapped using a helper. This
> makes it easier to map it into the SoC's memory container along with
> the other devices in the future.
> 
> While here, rename the region from uart0 to uart1. The uart0 name was
> a leftover from an earlier revision that used a different device for
> the console.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   include/hw/riscv/tt_atlantis.h |  2 ++
>   hw/riscv/tt_atlantis.c         | 19 ++++++++++++++++---
>   2 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/riscv/tt_atlantis.h b/include/hw/riscv/tt_atlantis.h
> index 7f7d4a5a5905..c9308aa57017 100644
> --- a/include/hw/riscv/tt_atlantis.h
> +++ b/include/hw/riscv/tt_atlantis.h
> @@ -13,6 +13,7 @@
>   #include "hw/core/sysbus.h"
>   #include "hw/i2c/designware_i2c.h"
>   #include "hw/intc/riscv_imsic.h"
> +#include "hw/misc/unimp.h"
>   #include "hw/riscv/riscv_hart.h"
>   
>   #define TYPE_TT_ATLANTIS_MACHINE MACHINE_TYPE_NAME("tt-atlantis")
> @@ -31,6 +32,7 @@ struct TTAtlantisState {
>       RISCVHartArrayState soc;
>       DeviceState *irqchip;
>       DesignWareI2CState i2c[TT_ATL_NUM_I2C];
> +    UnimplementedDeviceState uart1;
>   
>       int fdt_size;
>   };
> diff --git a/hw/riscv/tt_atlantis.c b/hw/riscv/tt_atlantis.c
> index 3f183db5c302..acfd0d31b368 100644
> --- a/hw/riscv/tt_atlantis.c
> +++ b/hw/riscv/tt_atlantis.c
> @@ -409,6 +409,17 @@ static void load_fdt(TTAtlantisState *s)
>       create_fdt_memory(s);
>   }
>   
> +static void mmio_map_unimplemented(MemoryRegion *memory, SysBusDevice *dev,
> +                                   const char *name, hwaddr addr, uint64_t size)
> +{
> +    qdev_prop_set_string(DEVICE(dev), "name", name);
> +    qdev_prop_set_uint64(DEVICE(dev), "size", size);
> +    sysbus_realize(dev, &error_abort);
> +
> +    memory_region_add_subregion_overlap(memory, addr,
> +                                        sysbus_mmio_get_region(dev, 0), -1000);
> +}

Peter, maybe it is time to allow this boiler plate as a generic helper?

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


