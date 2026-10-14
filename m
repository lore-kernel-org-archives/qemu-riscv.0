Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8F5C3DA7A
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 17:22:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xH2g4-0007sB-16; Wed, 14 Oct 2026 13:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xH2g0-0007rN-NC
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 13:22:06 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xH2fz-0004Y2-1H
 for qemu-riscv@nongnu.org; Wed, 14 Oct 2026 13:22:04 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69EEbIPq467729
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 17:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Bem+LxRUYmIOQNTbX/QX3Xrf/i/l0R0YUbLzjY/AllM=; b=MkukNoWhBc+e5htx
 QYJxnT7F/ltcmii89zQt9whktK+2oREyn7VWLk4mSx39EWVjUxAiJehfYDwfS3II
 dJQvtuB8+X8/T1OzJUDMtsJpbe1+rnsw4jXRfuP7CFIWKOB97Sijv3mlCamHSdfS
 Xwh8ktkwCmQoFKpAJ6pruWPW8vAEBTkl+UjqzDIiBVMKA08yiaX/g9MQwo8EUOUn
 Tr1ehIlZ5Dxge2jmSrxqUuWrVP/nb6LPWbXF44nehntztHkKQxwLopxTocr5N3/X
 m8McaZfJcg+O5cEUjqvvfGqH5ZKNDRRFjZzfoGNY4V1lnDw99vCCr4Ac7LkGyc3F
 LziXQQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9yphkqpn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 17:22:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-30c0d568830so8963318eec.1
 for <qemu-riscv@nongnu.org>; Wed, 14 Oct 2026 10:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791998521; x=1792603321; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Bem+LxRUYmIOQNTbX/QX3Xrf/i/l0R0YUbLzjY/AllM=;
 b=CiNGJQTTPKLsirt1TDolQf97iitKr55fNYkynu+BZ3UgUoI/dY5gyHT3jAKaDZMJyk
 iXtVaBELWhdhxmmUaBIJ7QIrLc4gS6jOXTwQTdjpEMLE1sMyhHn+Z8EKc3EI390pPrRS
 CTr/+EU03WioOvqFB1BuqVJ3hfs+M5ue4ANdHJxc9f3KSieY0SV/lkcPuQcKurQ20r4R
 ajaQcmG3sUsHYPE3dgaXzNdn66iFGOmFwfZnP9z/qj7Az5GoswSNTfBMpYrCY/q32h92
 XzE36+4wPlchqxl8UgnyI2Va3XNYj5WlytWHtDXstofSgfY+zZ8jD+NrwDfEWkeoQDXX
 29Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791998521; x=1792603321;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Bem+LxRUYmIOQNTbX/QX3Xrf/i/l0R0YUbLzjY/AllM=;
 b=IlhVKUkorKaMlttXm+McENh/IgYFCz0q86bK+37MjgU5hze3F/wkVLxF7KoyBkevlK
 ucueDGxOoDMQTvUV7lEC4YeXbdl3kkY2dOHA3grsvh7pmOnrSTZsUrXw36GlGphxJaLq
 wURoDHWAOjA/ax7apbaodYVblaRyufHW0bj8ukh6O/sUobKlug/vUYw3USnsH+gNLrsK
 q8ojzGOcXC1qMKfU6A3doPNsHfBqdFdRpB3G9xpxt+5u/+GVHtOB5ryYB8/0+/L4CHIC
 F7DqPP63vsiG5g2Du4LQsWQRfBJhuzAC7O1OxBVSc2P660taurKwfaaYC3IFe1i8P/2Y
 2vag==
X-Forwarded-Encrypted: i=1;
 AKwUvBwbckzavoqRu5VBPI5cFvrvR/Ffb+zeu7KyoKNsa2WYqVWVtrUkvisMoyqMq1tJ+lCu3vq0o2z7AnDC@nongnu.org
X-Gm-Message-State: AFq9FYIT5phfyB7g9EJZknY7Y1NcFzqiudprHCm6PErwREcjECO/SI15
 NRjEBMHXibmeXkgBAP9Sg2qqyvrBEtvoOXyu2PPZiOLCYvFxORzUNuJkH/azhUkb54BRJQc4Ifi
 oBnbkoK3ZMp4uhb7gBn0oGBC9oJkRJeTgzi7ggGsxFwYLTKa1/lFLl8rWqg==
X-Gm-Gg: AYBFou2qVafsqxuR+iDpZoWHlZtG2VQDTnB7zwl74ZhlMpjeEJ3QfsapOQgOaOLQUGO
 j7y+eMc26g3P602xdOuj439K3GVIRK0Q4/vFa76dDPWK5P+V1oZ6Tn2W7qnFgVMd+qHaDgNB1FB
 ybaZs2xKb3pbS+msQs9NGzZSt5P2PEMwaPuio2bZrFJz+maRWrcwo8deDBp10VOeXsUZcRTeVrO
 2v7YCU2kNsCk/2ewrdAK52ZZTgC/T0E75Mp5Gz/MJFIHYUBvcVMnYaBAKL3UxpzkYBASI/9kjUx
 6HAcpXYzAsA0xbyigLZyYmFHj8UqNSkCXrti/eY2le65s9GWciGbMB92lAQgL6T5BYW2qo902Mg
 eHSHUyk3hTfcrrT7M9oJyHHsA0Ml9qyolVVZnCwsum/1DxDAXM3S+/fzW7pH+cjTMnPBMFg==
X-Received: by 2002:a05:7301:9a93:b0:35b:2d66:942b with SMTP id
 5a478bee46e88-35b2d6697d3mr11847121eec.13.1791998520625; 
 Wed, 14 Oct 2026 10:22:00 -0700 (PDT)
X-Received: by 2002:a05:7301:9a93:b0:35b:2d66:942b with SMTP id
 5a478bee46e88-35b2d6697d3mr11847064eec.13.1791998519998; 
 Wed, 14 Oct 2026 10:21:59 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3537cab27d5sm60664206eec.17.2026.10.14.10.21.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 10:21:59 -0700 (PDT)
Message-ID: <8f2da1a8-25fa-4773-a9f0-1da56c0d29d4@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 10:21:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/34] hw/virtio/virtio-mem: Avoid call to target_info()
 in class_init
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Eric Blake <eblake@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Ani Sinha <anisinha@redhat.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 David Hildenbrand <david@kernel.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <laurent@vivier.eu>, Fabiano Rosas <farosas@suse.de>,
 Song Gao <17746591750@163.com>, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Chao Liu <chao.liu@processmission.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>
References: <20261014094224.1976-1-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261014094224.1976-1-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ODgx7KhRJbsnPxSIuKj6XbcYe8hh5zkx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2OSBTYWx0ZWRfXy9U7K5VO97hH
 Qhq4LfNrWwwngDEMjY3KmqGKe8+VzDNFXVyBzSiY2kEqIhBrhj35QStr/MLsh90HfLeF0zNXq+A
 /ZMKtDN5nBOOvJtC6G7y2t/F4/D3834=
X-Proofpoint-ORIG-GUID: ODgx7KhRJbsnPxSIuKj6XbcYe8hh5zkx
X-Authority-Analysis: v=2.4 cv=Uv72pOwB c=1 sm=1 tr=0 ts=6acfba39 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=OEecPaBRvUleK0BGN0QA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2OSBTYWx0ZWRfX9JM96Huu60nb
 cvE7m4N5ohcORI9scXhBxlIrr4KH7vJg2x4hvTudehYM6pzLhF/wEpenUlndkaTgl6re6DMfuvf
 Giq2UQ7JIkoraMWhGgkH5/OUktzHG+RgXDpdw0FHt6cZON7yCdljO2ydOSTsCkW86ObWytEumVX
 N92BcsFt1msxItRFc+rq2l+aAUIN0SXCXNcbCsdC+NweuzfaNTELKeJDILfExY+6TGAWE5MuN+w
 7PswFzmEN18bH1X22rAoIi48zSFkqm2s/3GrMWJ0MpOimiifIl2oeu8ly41APBGR+M5FkwuSS4G
 4hr89TsusaXHe+dtWeKx9SRNY7iM7GnggxQWJi0FEvNSvgaQRixB1JkNbY2nmWcut1uv6Y0tDHa
 QdaPC1QVlT0NrcmK9dxA4oxuQmAx4jOHc8cXXtWWT/W4n23U7C7qBnUIfiJJmujQjIrmlMCQPis
 4Z4NMqPMLyPdDYYWg2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140069
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 10/14/2026 2:41 AM, Yonggang Luo wrote:
> Done by merge virtio_mem_legacy_guests_properties into virtio_mem_properties.
> As we already have vmem->unplugged_inaccessible handle in virtio_mem_device_realize
> So we can reject the wrong option in virtio_mem_device_realize, then the call
> target_info() in class_init no need anymore.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  hw/virtio/virtio-mem.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index a4110d61312..81e2192c2fb 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -879,7 +879,11 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
>              break;
>          }
>      } else {
> -        vmem->unplugged_inaccessible = ON_OFF_AUTO_ON;
> +        if (vmem->unplugged_inaccessible != ON_OFF_AUTO_ON) {
> +            error_setg(errp, "'%s' must be 'on' on non-x86 targets",
> +                       VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP);
> +            return;
> +        }
>      }
>  
>      if (vmem->dynamic_memslots &&
> @@ -1568,9 +1572,6 @@ static const Property virtio_mem_properties[] = {
>                       early_migration, true),
>      DEFINE_PROP_BOOL(VIRTIO_MEM_DYNAMIC_MEMSLOTS_PROP, VirtIOMEM,
>                       dynamic_memslots, false),
> -};
> -
> -static const Property virtio_mem_legacy_guests_properties[] = {
>      DEFINE_PROP_ON_OFF_AUTO(VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP, VirtIOMEM,
>                              unplugged_inaccessible, ON_OFF_AUTO_ON),
>  };
> @@ -1635,9 +1636,6 @@ static void virtio_mem_class_init(ObjectClass *klass, const void *data)
>      RamDiscardSourceClass *rdsc = RAM_DISCARD_SOURCE_CLASS(klass);
>  
>      device_class_set_props(dc, virtio_mem_properties);
> -    if (virtio_mem_has_legacy_guests()) {
> -        device_class_set_props(dc, virtio_mem_legacy_guests_properties);
> -    }
>      dc->vmsd = &vmstate_virtio_mem;
>  
>      set_bit(DEVICE_CATEGORY_MISC, dc->categories);

Not sure what happened with the sending, but it seems like this series
has been split in two threads.

