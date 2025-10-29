Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3255FCCD1BF
	for <qemu-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 05:55:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDz8e-0002Tr-Bt; Wed, 29 Oct 2025 01:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vDz8b-0002TS-VP
 for qemu-riscv@nongnu.org; Wed, 29 Oct 2025 01:54:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vDz8U-0004OD-I9
 for qemu-riscv@nongnu.org; Wed, 29 Oct 2025 01:54:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761717255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=UX50O7T+6CxtK81aShDu/YtHqTLIzDtu/vk5nKaFd/E=;
 b=dgHPAzNai45aTYKzFaeKOcn3YlFxmyhZ56dPz5Pgoaz83A2077rwzYzZHvIuTsK82Kw44a
 dn6BrVxDfo38dLy2fESRkDvGfCR5TDrEqaoJHhZ2+lqQc5pNp8O4kKDz5HIppTfm840wVv
 4A83Pjs5mNnHQbheiTLVvAA5R/VnD+Y=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-d2WuaOQ_PniNIp0r0sNkrA-1; Wed, 29 Oct 2025 01:54:14 -0400
X-MC-Unique: d2WuaOQ_PniNIp0r0sNkrA-1
X-Mimecast-MFC-AGG-ID: d2WuaOQ_PniNIp0r0sNkrA_1761717253
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-b704635310aso21399866b.3
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 22:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761717253; x=1762322053;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UX50O7T+6CxtK81aShDu/YtHqTLIzDtu/vk5nKaFd/E=;
 b=F/HXt9Kq5632bCxT1Jz9qx1kn2kOwOxdONkbfHf2RQRYteYdeTpjJV2T8L0GlCeUrP
 2vP5qyDh9TjavQjQSA7Va63lt5v3NzAC4XvtRGQQWndmn2SsLQFUdcLZGf2Jkd0sdX/L
 kT6sLH8muYIzvgon6gh+9QJ/1zgFzca1lZ8qkdEKaF00y6u6be9EeIPEj/pm6P+holbi
 VdZyF1tRyijkOkVhKFCn2z2W2Yd3YT65gP3aa2i387khc+dFG3KG7eKPB3rWiypIt9Bq
 fqDdzaauKJsw/jYJlJWYZK9Fu+j341kwrZnZWcAcHT0bnB+M9M/1Cn5pGtfJQLndhwmq
 Q4Sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhSl9KoJZAYbJmwStLM5a8jvUoDQF+4XmwP1o26ruea7n2RxC78CHUwkLNrhPFFnvt3qFv1lnAvUZM@nongnu.org
X-Gm-Message-State: AOJu0YxI9naPUkp1fxYSKWe0UgZiYn/ozpdjxtUZjDDyyX9AMLMbG/cc
 9RhhPR/fcQyyU+b5xaIpKehQ6EIhQSiQ9pjb2G+0GamkE/IhFwvoBYAQc1PDeU9lJqdNFK8wR8u
 l993hLeNhYhR/1U947BtZr3SVUBMfeVMe+tiGzIOaByIQfrLc2TJx4bj2
X-Gm-Gg: ASbGncuCD/isIOdW9nnw+8OeEmG2gTEZPEVUhldQJZ16N8Hq4zVqH8VeTr9+OeoZLZI
 NlAwP3dPxTcICFy8krWL1jdvTtoEWN6CV4jVqmGijqRzFVkZx+rijoO91SGdK5oZALuTufhr+t4
 flusEnFwxVGETVTjCON3k/fjZLrY3IQKVFwYI/LA4dFxBd3Vo498EeIACoLwOvZne5IJftUENQy
 465++L7DiXiC9FQ7RGX/V8TwoDEL2isBoluSYWK2TsTfEPBEF2zcHJQ5DgXL5RRfH2suIL2ZrAQ
 cSUaYhBeRLLox+22vmMI/LcSWeZYyUmc+cXl+chc/YzH3ZJ7PvAhsfxST8qrEo8tPxM0b4I=
X-Received: by 2002:a17:907:7f05:b0:b40:b6a9:f70f with SMTP id
 a640c23a62f3a-b703d2df135mr166787966b.4.1761717253027; 
 Tue, 28 Oct 2025 22:54:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFik65qdjmueHclY9gon6Wx4R5zrHjc6TQ224JHpzE5acyhDtwvh87X29lDry6wm5gcTHGf4w==
X-Received: by 2002:a17:907:7f05:b0:b40:b6a9:f70f with SMTP id
 a640c23a62f3a-b703d2df135mr166786366b.4.1761717252608; 
 Tue, 28 Oct 2025 22:54:12 -0700 (PDT)
Received: from [192.168.0.7] ([47.64.112.33]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64043e05a5esm1201107a12.4.2025.10.28.22.54.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 22:54:11 -0700 (PDT)
Message-ID: <179d3e89-91e5-4845-a415-a136ef36fdc3@redhat.com>
Date: Wed, 29 Oct 2025 06:54:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/25] hw/i386/microvm: Use proper SysBus accessors
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20251028181300.41475-1-philmd@linaro.org>
 <20251028181300.41475-2-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 xsFNBFH7eUwBEACzyOXKU+5Pcs6wNpKzrlJwzRl3VGZt95VCdb+FgoU9g11m7FWcOafrVRwU
 yYkTm9+7zBUc0sW5AuPGR/dp3pSLX/yFWsA/UB4nJsHqgDvDU7BImSeiTrnpMOTXb7Arw2a2
 4CflIyFqjCpfDM4MuTmzTjXq4Uov1giGE9X6viNo1pxyEpd7PanlKNnf4PqEQp06X4IgUacW
 tSGj6Gcns1bCuHV8OPWLkf4hkRnu8hdL6i60Yxz4E6TqlrpxsfYwLXgEeswPHOA6Mn4Cso9O
 0lewVYfFfsmokfAVMKWzOl1Sr0KGI5T9CpmRfAiSHpthhHWnECcJFwl72NTi6kUcUzG4se81
 O6n9d/kTj7pzTmBdfwuOZ0YUSqcqs0W+l1NcASSYZQaDoD3/SLk+nqVeCBB4OnYOGhgmIHNW
 0CwMRO/GK+20alxzk//V9GmIM2ACElbfF8+Uug3pqiHkVnKqM7W9/S1NH2qmxB6zMiJUHlTH
 gnVeZX0dgH27mzstcF786uPcdEqS0KJuxh2kk5IvUSL3Qn3ZgmgdxBMyCPciD/1cb7/Ahazr
 3ThHQXSHXkH/aDXdfLsKVuwDzHLVSkdSnZdt5HHh75/NFHxwaTlydgfHmFFwodK8y/TjyiGZ
 zg2Kje38xnz8zKn9iesFBCcONXS7txENTzX0z80WKBhK+XSFJwARAQABzR5UaG9tYXMgSHV0
 aCA8dGh1dGhAcmVkaGF0LmNvbT7CwXgEEwECACIFAlVgX6oCGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAAoJEC7Z13T+cC21EbIP/ii9cvT2HHGbFRl8HqGT6+7Wkb+XLMqJBMAIGiQK
 QIP3xk1HPTsLfVG0ao4hy/oYkGNOP8+ubLnZen6Yq3zAFiMhQ44lvgigDYJo3Ve59gfe99KX
 EbtB+X95ODARkq0McR6OAsPNJ7gpEUzfkQUUJTXRDQXfG/FX303Gvk+YU0spm2tsIKPl6AmV
 1CegDljzjycyfJbk418MQmMu2T82kjrkEofUO2a24ed3VGC0/Uz//XCR2ZTo+vBoBUQl41BD
 eFFtoCSrzo3yPFS+w5fkH9NT8ChdpSlbNS32NhYQhJtr9zjWyFRf0Zk+T/1P7ECn6gTEkp5k
 ofFIA4MFBc/fXbaDRtBmPB0N9pqTFApIUI4vuFPPO0JDrII9dLwZ6lO9EKiwuVlvr1wwzsgq
 zJTPBU3qHaUO4d/8G+gD7AL/6T4zi8Jo/GmjBsnYaTzbm94lf0CjXjsOX3seMhaE6WAZOQQG
 tZHAO1kAPWpaxne+wtgMKthyPLNwelLf+xzGvrIKvLX6QuLoWMnWldu22z2ICVnLQChlR9d6
 WW8QFEpo/FK7omuS8KvvopFcOOdlbFMM8Y/8vBgVMSsK6fsYUhruny/PahprPbYGiNIhKqz7
 UvgyZVl4pBFjTaz/SbimTk210vIlkDyy1WuS8Zsn0htv4+jQPgo9rqFE4mipJjy/iboDzsFN
 BFH7eUwBEAC2nzfUeeI8dv0C4qrfCPze6NkryUflEut9WwHhfXCLjtvCjnoGqFelH/PE9NF4
 4VPSCdvD1SSmFVzu6T9qWdcwMSaC+e7G/z0/AhBfqTeosAF5XvKQlAb9ZPkdDr7YN0a1XDfa
 +NgA+JZB4ROyBZFFAwNHT+HCnyzy0v9Sh3BgJJwfpXHH2l3LfncvV8rgFv0bvdr70U+On2XH
 5bApOyW1WpIG5KPJlDdzcQTyptOJ1dnEHfwnABEfzI3dNf63rlxsGouX/NFRRRNqkdClQR3K
 gCwciaXfZ7ir7fF0u1N2UuLsWA8Ei1JrNypk+MRxhbvdQC4tyZCZ8mVDk+QOK6pyK2f4rMf/
 WmqxNTtAVmNuZIwnJdjRMMSs4W4w6N/bRvpqtykSqx7VXcgqtv6eqoDZrNuhGbekQA0sAnCJ
 VPArerAZGArm63o39me/bRUQeQVSxEBmg66yshF9HkcUPGVeC4B0TPwz+HFcVhheo6hoJjLq
 knFOPLRj+0h+ZL+D0GenyqD3CyuyeTT5dGcNU9qT74bdSr20k/CklvI7S9yoQje8BeQAHtdV
 cvO8XCLrpGuw9SgOS7OP5oI26a0548M4KldAY+kqX6XVphEw3/6U1KTf7WxW5zYLTtadjISB
 X9xsRWSU+Yqs3C7oN5TIPSoj9tXMoxZkCIHWvnqGwZ7JhwARAQABwsFfBBgBAgAJBQJR+3lM
 AhsMAAoJEC7Z13T+cC21hPAQAIsBL9MdGpdEpvXs9CYrBkd6tS9mbaSWj6XBDfA1AEdQkBOn
 ZH1Qt7HJesk+qNSnLv6+jP4VwqK5AFMrKJ6IjE7jqgzGxtcZnvSjeDGPF1h2CKZQPpTw890k
 fy18AvgFHkVk2Oylyexw3aOBsXg6ukN44vIFqPoc+YSU0+0QIdYJp/XFsgWxnFIMYwDpxSHS
 5fdDxUjsk3UBHZx+IhFjs2siVZi5wnHIqM7eK9abr2cK2weInTBwXwqVWjsXZ4tq5+jQrwDK
 cvxIcwXdUTLGxc4/Z/VRH1PZSvfQxdxMGmNTGaXVNfdFZjm4fz0mz+OUi6AHC4CZpwnsliGV
 ODqwX8Y1zic9viSTbKS01ZNp175POyWViUk9qisPZB7ypfSIVSEULrL347qY/hm9ahhqmn17
 Ng255syASv3ehvX7iwWDfzXbA0/TVaqwa1YIkec+/8miicV0zMP9siRcYQkyTqSzaTFBBmqD
 oiT+z+/E59qj/EKfyce3sbC9XLjXv3mHMrq1tKX4G7IJGnS989E/fg6crv6NHae9Ckm7+lSs
 IQu4bBP2GxiRQ+NV3iV/KU3ebMRzqIC//DCOxzQNFNJAKldPe/bKZMCxEqtVoRkuJtNdp/5a
 yXFZ6TfE1hGKrDBYAm4vrnZ4CXFSBDllL59cFFOJCkn4Xboj/aVxxJxF30bn
In-Reply-To: <20251028181300.41475-2-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4G61eEnsNhtB54k_FP9adZ91nHe8J5kapEnHm3G7A38_1761717253
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 28/10/2025 19.12, Philippe Mathieu-Daudé wrote:
> SysBusDevice::mmio[] is private data of SysBusDevice, use
> sysbus_mmio_get_region() to access it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/i386/microvm-dt.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
> index cb27dfd732e..d7f49bc1b5f 100644
> --- a/hw/i386/microvm-dt.c
> +++ b/hw/i386/microvm-dt.c
> @@ -71,7 +71,8 @@ static void dt_add_virtio(MicrovmMachineState *mms, VirtIOMMIOProxy *mmio)
>           return;
>       }
>   
> -    hwaddr base = dev->mmio[0].addr;
> +    MemoryRegion *mr = sysbus_mmio_get_region(dev, 0);
> +    hwaddr base = mr->addr;
>       hwaddr size = 512;
>       unsigned index = (base - VIRTIO_MMIO_BASE) / size;
>       uint32_t irq = mms->virtio_irq_base + index;
> @@ -150,7 +151,8 @@ static void dt_add_pcie(MicrovmMachineState *mms)
>   
>   static void dt_add_ioapic(MicrovmMachineState *mms, SysBusDevice *dev)
>   {
> -    hwaddr base = dev->mmio[0].addr;
> +    MemoryRegion *mr = sysbus_mmio_get_region(dev, 0);
> +    hwaddr base = mr->addr;
>       char *nodename;
>       uint32_t ph;
>       int index;

Wouldn't it make sense to move patch 11 before this patch, and then to use 
memory_region_get_address() here directly?

  Thomas


