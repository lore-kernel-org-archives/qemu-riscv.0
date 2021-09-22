Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mT6N7-0004kw-Oh
	for mharc-qemu-riscv@gnu.org; Wed, 22 Sep 2021 13:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mT6N5-0004jU-K5
 for qemu-riscv@nongnu.org; Wed, 22 Sep 2021 13:49:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mT6N2-0006Y6-9M
 for qemu-riscv@nongnu.org; Wed, 22 Sep 2021 13:49:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632332963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8R2eWgo3mCPiEWKHImVoU3s0Qt0O78iy+gHqpXKDMHg=;
 b=Ag07l4jLOAcBPXgy08f5PMjSH8BISpFcZxHWZ3NGnZCCw7EE04gLvZDd+bE4A/TshlKUM5
 Y6Z3qfmDFq7fmG6SXXJthZfZldme8mgOvhqpi/w/LyrcsIdAnS4XuiDMVtKiCYaiwv7yB5
 0Yum6r0WiiSNefvjClMXaBHTJ4Ou5Ec=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-ZI_SyD33PVeoNjth_Q2MMA-1; Wed, 22 Sep 2021 13:49:22 -0400
X-MC-Unique: ZI_SyD33PVeoNjth_Q2MMA-1
Received: by mail-wr1-f72.google.com with SMTP id
 u10-20020adfae4a000000b0016022cb0d2bso2839557wrd.19
 for <qemu-riscv@nongnu.org>; Wed, 22 Sep 2021 10:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=8R2eWgo3mCPiEWKHImVoU3s0Qt0O78iy+gHqpXKDMHg=;
 b=hfP+bMst7nsU85MYvyFSXdxFspm3T78LnGv4H4tYK95REEjEw4AkiOuDahebQawrSr
 utkLTv4zIdq/ZkuSzsbs9NQbgL1N5pdFIe9fSCh7IPUF270B9ObVugEP9RHi+rgv2BKs
 2O1CWiozS0nCWxx4FW76Nr0iXdY9YZKE1oqJutPPVR2eWBerRkpbQFB2CB2b4SVjxAoB
 9vL7KLnNmuuL0FW23rjz8eMNP9rnniYAa1L1QJ/miPLqi6uf0iGaWYjaiJFxGUdUtugj
 RfZssUgLKBsncgIK566W+K3ImMxzVlhh9fDls9Ksyyvv+BHistdlkXQVH+yvhGqivBo2
 PJvA==
X-Gm-Message-State: AOAM533a47RPwXGeIkaULig0PWa7zLiar3Gb2tRhNubH6PBQQj6hgy4i
 Va5l8SwLOpR1XQ9PNSvMP4aUUK3AhJLM4zklxlEaOYs2ooUVSAoJRsTuwo6woD5qbQQm7PJS3wn
 iJ2FpR4xXcrPiizU=
X-Received: by 2002:a05:6000:1844:: with SMTP id
 c4mr187158wri.355.1632332961361; 
 Wed, 22 Sep 2021 10:49:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDZycGgzlG5PLVo/6Isj0bTJcO/O5J4WdjAYiBchkHxW5ecBClNDAyi9t+1qZPrUoaXfO12g==
X-Received: by 2002:a05:6000:1844:: with SMTP id
 c4mr187105wri.355.1632332961083; 
 Wed, 22 Sep 2021 10:49:21 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64dd.dip0.t-ipconnect.de. [91.12.100.221])
 by smtp.gmail.com with ESMTPSA id m4sm3482985wrx.81.2021.09.22.10.49.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 10:49:20 -0700 (PDT)
Subject: Re: [RFC PATCH v2 11/16] softmmu/memory: add
 memory_region_try_add_subregion function
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-riscv@nongnu.org,
 xen-devel@lists.xenproject.org, mark.burton@greensocs.com,
 mirela.grujic@greensocs.com, edgari@xilinx.com,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-12-damien.hedde@greensocs.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <8ff0d8c9-94f1-cc21-a9f9-bb5fcd1cc3e7@redhat.com>
Date: Wed, 22 Sep 2021 19:49:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210922161405.140018-12-damien.hedde@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.472, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Sep 2021 17:49:28 -0000

On 22.09.21 18:14, Damien Hedde wrote:
> It allows to try to add a subregion to a memory region with error
> handling. Like memory_region_add_subregion_overlap, it handles
> priority as well.
> Apart the error handling, the behavior is the same. It can be used
> to do the simple memory_region_add_subregion() (with no overlap) by
> setting the priority parameter to 0.
> 
> This commit is a preparation to further use this function in the
> context of qmp command which needs error handling support.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
> 
> Adding a new function is obviously not ideal. But there is ~900
> occurrences of memory_region_add_subregion[_overlap] calls in the code
> base. We do not really see an alternative here.
> ---
>   include/exec/memory.h | 22 ++++++++++++++++++++++
>   softmmu/memory.c      | 22 ++++++++++++++--------
>   2 files changed, 36 insertions(+), 8 deletions(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index c3d417d317..422e1eda67 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2162,6 +2162,28 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
>                                            MemoryRegion *subregion,
>                                            int priority);
>   
> +/**
> + * memory_region_try_add_subregion: Add a subregion to a container
> + *                                  with error handling.
> + *
> + * Behaves like memory_region_add_subregion_overlap(), but errors are
> + * reported if the subregion cannot be added.
> + *
> + * @mr: the region to contain the new subregion; must be a container
> + *      initialized with memory_region_init().
> + * @offset: the offset relative to @mr where @subregion is added.
> + * @subregion: the subregion to be added.
> + * @priority: used for resolving overlaps; highest priority wins.
> + * @errp: pointer to Error*, to store an error if it happens.
> + *
> + * Returns: True in case of success, false otherwise.
> + */
> +bool memory_region_try_add_subregion(MemoryRegion *mr,
> +                                     hwaddr offset,
> +                                     MemoryRegion *subregion,
> +                                     int priority,
> +                                     Error **errp);
> +
>   /**
>    * memory_region_get_ram_addr: Get the ram address associated with a memory
>    *                             region
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index bfedaf9c4d..eac61f8236 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2513,22 +2513,28 @@ done:
>       memory_region_transaction_commit();
>   }
>   
> -static void memory_region_add_subregion_common(MemoryRegion *mr,
> -                                               hwaddr offset,
> -                                               MemoryRegion *subregion)
> +bool memory_region_try_add_subregion(MemoryRegion *mr,
> +                                     hwaddr offset,
> +                                     MemoryRegion *subregion,
> +                                     int priority,
> +                                     Error **errp)
>   {
> -    assert(!subregion->container);
> +    if (subregion->container) {
> +        error_setg(errp, "The memory region is already in another region");
> +        return false;
> +    }
> +    subregion->priority = priority;
>       subregion->container = mr;
>       subregion->addr = offset;
>       memory_region_update_container_subregions(subregion);
> +    return true;
>   }
>   
>   void memory_region_add_subregion(MemoryRegion *mr,
>                                    hwaddr offset,
>                                    MemoryRegion *subregion)
>   {
> -    subregion->priority = 0;
> -    memory_region_add_subregion_common(mr, offset, subregion);
> +    memory_region_try_add_subregion(mr, offset, subregion, 0, &error_abort);
>   }
>   
>   void memory_region_add_subregion_overlap(MemoryRegion *mr,
> @@ -2536,8 +2542,8 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
>                                            MemoryRegion *subregion,
>                                            int priority)
>   {
> -    subregion->priority = priority;
> -    memory_region_add_subregion_common(mr, offset, subregion);
> +    memory_region_try_add_subregion(mr, offset, subregion, priority,
> +                                    &error_abort);
>   }
>   
>   void memory_region_del_subregion(MemoryRegion *mr,
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


