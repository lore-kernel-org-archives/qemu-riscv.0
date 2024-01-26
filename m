Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B926C47422
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jan 2024 16:37:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rTPCR-0004CQ-Vf; Fri, 26 Jan 2024 11:37:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rTPCQ-00042c-DG
 for qemu-riscv@nongnu.org; Fri, 26 Jan 2024 11:37:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rTPCO-0005Fy-RT
 for qemu-riscv@nongnu.org; Fri, 26 Jan 2024 11:37:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706287019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yHJA/a7AtrkrA1dPhXzDTAA1K342Bby9O7QNX8c10rA=;
 b=TjTxgJhg2g/7I5M4aTbg9xxgx31URO1u1wuw090ZZWcNKsHWvvcNOT4R7n7WQbJSDMsUuG
 MOsJkwzs5GaljnOv5i6OnA1daBnXCD13mEY73bU6qq72A/0SZBE1+rlNzulsMO5TZyJKvu
 QfDwunHEwPRUXapADq/FpdmPFh0JM54=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-mnTyCcYaOLe9PmgQ2gK1Cg-1; Fri, 26 Jan 2024 11:36:58 -0500
X-MC-Unique: mnTyCcYaOLe9PmgQ2gK1Cg-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-68194fcd1f1so33171516d6.0
 for <qemu-riscv@nongnu.org>; Fri, 26 Jan 2024 08:36:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706287018; x=1706891818;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yHJA/a7AtrkrA1dPhXzDTAA1K342Bby9O7QNX8c10rA=;
 b=Y+B7a9DDUdqLRUwO01VYFJFl2+vKrZRhFrdGYjU62JfvzUyMLuTzxAt1Ifh5SFyzek
 ofOWO5PGMC92XNx4YhIH0VomjmMlq/5V4JkwFMy46qpBu0YolMqio0fzOxdWxvpqes3U
 OXRW3mviiCBtDItH3NbVe+agE/ZhHh0i1UwMgGQvIyqh/MHFBiDuGVLGZdLehjW63I9C
 TbzJ1mpzQcbqdOZyRNqQU16LmZtAuEEotte/KN9EnRrS/i+9LM/tvJULiEFsbhSDNVqM
 a0nUL/zLspNSS9i6+iz54KtazINfNAUHtoqhfMQtVr6pxZp+eplsM0/BEtWwADdlMSul
 LMHg==
X-Gm-Message-State: AOJu0YxnJL/xv2DFkv+ZwnT+gTlDiq5LYPzQhYcLsh4hfswUQSgE5Ce1
 gRFtDyCDY1CaurZk9dqT3zVFRJ+BVY5Y3cG94SliDNO6l2FjwgfliLwjWNvivmEjXiAGYbFBCv1
 YuCu1gtsqVDsEfR5aS6GMLQ/eFnl0yK9DheYX3J92ofUWSYv2Yq3N
X-Received: by 2002:a05:6214:d6d:b0:68c:3504:19a1 with SMTP id
 13-20020a0562140d6d00b0068c350419a1mr152672qvs.32.1706287018224; 
 Fri, 26 Jan 2024 08:36:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEYqONftzwFkQaen4n9m6+D/pp+9cG9WOY8KzIaN5G9jpk3hXZtBk78M0Jq+/+iQBTnpZlqg==
X-Received: by 2002:a05:6214:d6d:b0:68c:3504:19a1 with SMTP id
 13-20020a0562140d6d00b0068c350419a1mr152658qvs.32.1706287017965; 
 Fri, 26 Jan 2024 08:36:57 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-176-119.web.vodafone.de.
 [109.43.176.119]) by smtp.gmail.com with ESMTPSA id
 od10-20020a0562142f0a00b0068c37c745f4sm146555qvb.21.2024.01.26.08.36.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jan 2024 08:36:57 -0800 (PST)
Message-ID: <b684476f-e5c1-41ff-be02-c63a68109011@redhat.com>
Date: Fri, 26 Jan 2024 17:36:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 39/46] hw/riscv: use qemu_configure_nic_device()
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 David Woodhouse <dwmw@amazon.co.uk>
References: <20240108204909.564514-1-dwmw2@infradead.org>
 <20240108204909.564514-40-dwmw2@infradead.org>
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
In-Reply-To: <20240108204909.564514-40-dwmw2@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.313,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 08/01/2024 21.27, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/riscv/microchip_pfsoc.c | 14 ++------------
>   hw/riscv/sifive_u.c        |  7 +------
>   2 files changed, 3 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index b775aa8946..7725dfbde5 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -202,7 +202,6 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
>       MemoryRegion *envm_data = g_new(MemoryRegion, 1);
>       MemoryRegion *qspi_xip_mem = g_new(MemoryRegion, 1);
>       char *plic_hart_config;
> -    NICInfo *nd;
>       int i;
>   
>       sysbus_realize(SYS_BUS_DEVICE(&s->e_cpus), &error_abort);
> @@ -411,17 +410,8 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
>           memmap[MICROCHIP_PFSOC_USB].size);
>   
>       /* GEMs */
> -
> -    nd = &nd_table[0];
> -    if (nd->used) {
> -        qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
> -        qdev_set_nic_properties(DEVICE(&s->gem0), nd);
> -    }
> -    nd = &nd_table[1];
> -    if (nd->used) {
> -        qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
> -        qdev_set_nic_properties(DEVICE(&s->gem1), nd);
> -    }
> +    qemu_configure_nic_device(DEVICE(&s->gem0), true, NULL);
> +    qemu_configure_nic_device(DEVICE(&s->gem1), true, NULL);
>   
>       object_property_set_int(OBJECT(&s->gem0), "revision", GEM_REVISION, errp);
>       object_property_set_int(OBJECT(&s->gem0), "phy-addr", 8, errp);
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index ec76dce6c9..5207ec1fa5 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -789,7 +789,6 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
>       MemoryRegion *l2lim_mem = g_new(MemoryRegion, 1);
>       char *plic_hart_config;
>       int i, j;
> -    NICInfo *nd = &nd_table[0];
>   
>       qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-harts", ms->smp.cpus - 1);
>       qdev_prop_set_uint32(DEVICE(&s->u_cpus), "hartid-base", 1);
> @@ -893,11 +892,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
>       }
>       sysbus_mmio_map(SYS_BUS_DEVICE(&s->otp), 0, memmap[SIFIVE_U_DEV_OTP].base);
>   
> -    /* FIXME use qdev NIC properties instead of nd_table[] */
> -    if (nd->used) {
> -        qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
> -        qdev_set_nic_properties(DEVICE(&s->gem), nd);
> -    }
> +    qemu_configure_nic_device(DEVICE(&s->gem), true, NULL);
>       object_property_set_int(OBJECT(&s->gem), "revision", GEM_REVISION,
>                               &error_abort);
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->gem), errp)) {

Reviewed-by: Thomas Huth <thuth@redhat.com>


