Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1maYRy-0006hD-QL
	for mharc-qemu-riscv@gnu.org; Wed, 13 Oct 2021 03:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maYRt-0006fj-IL; Wed, 13 Oct 2021 03:13:16 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:47102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maYRr-00076i-Tj; Wed, 13 Oct 2021 03:13:13 -0400
Received: by mail-io1-xd2e.google.com with SMTP id s17so1647029ioa.13;
 Wed, 13 Oct 2021 00:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KHB4g6o0LeMzf6QhsqguIIRvH+olg3UnDhoJaR0aLNA=;
 b=avPTWRvD87X49NZcwlii0xdmVFI41b1HDJTeSUpV6LTstZj5FMBkZDEpcCnnV6wh09
 tkLv9db1x07e+t/oQyZn8p2e1N6gQiet1Pbm4ckl21olRRwSML+IJtPQ5J3XScYpq+mI
 JgiVbyQ7DFL7gdytixxEnQzk/i9FfuXjXfHvxwZBmRQWVR1ZzV+6Vgo4XssTxxUy0s6A
 MhZTjzoA5tZ8zJIWwjFjdo/7wfq4BkqVbsSWPrnHVJxA1rQCHHwxVPBYM9oKV14JGha3
 iZkQZGbR9s1yGyXVp/0KymzoP6LIaXMT1lzaITBayQAvzJwYyt4vLlVJlm4V3pmjWU+3
 dLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KHB4g6o0LeMzf6QhsqguIIRvH+olg3UnDhoJaR0aLNA=;
 b=PyR+SHOY/TKk65xQt++xRy+GVRg347AefTHG23YA3euv2da73TSAARm3+4I09FioV0
 65K6D+29B5YuWfOc+Dwvz+izAL7hKIrTvYlG3gMCDkFUnW50sApETRGvncO4vmY16590
 VPbIO5zIPgS5ckQi2Ek+xVccFU4fjOouk47o0ezOoDEQzh9xohf4Ab4bn2crPkQazBCy
 Iw00vKldn9G0thK6efdexpyuXSece2Y/mbRXtIOt8qLMctJGg8I1q3ttcECq7YDWB5rt
 wV82Po9+HN6ONmrvxiQ/frl+a1vLPFZiiSzA/MqZ7N+UJmSWJjHbyNzt1E3y2dtLs+zb
 /GdQ==
X-Gm-Message-State: AOAM530kKvX7nM893pauJnrDT4+1EaWSr05nA32NOeWUAlz4UrmLrfmV
 tXUwQBihkx5LR+zE+ll09e0DYpRr2KYpjT51KLQ=
X-Google-Smtp-Source: ABdhPJwAerQBrE6h1mAcc8a9ejLtUsRNqYkv/iKjXq1q0SyzeWPOBrz+6jeH+TXpXPz1j01S6PDyDckoOD1oFZSZOyY=
X-Received: by 2002:a05:6602:2e8c:: with SMTP id
 m12mr8986722iow.91.1634109190435; 
 Wed, 13 Oct 2021 00:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-12-damien.hedde@greensocs.com>
In-Reply-To: <20210922161405.140018-12-damien.hedde@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Oct 2021 17:12:44 +1000
Message-ID: <CAKmqyKMP5-8wGY6vFEXeiCgrJQhZRQWcYvyqbEihjCkv1bYEhQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 11/16] softmmu/memory: add
 memory_region_try_add_subregion function
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, 
 mirela.grujic@greensocs.com, Alistair Francis <Alistair.Francis@wdc.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>, 
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>, 
 Anthony Perard <anthony.perard@citrix.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Mark Burton <mark.burton@greensocs.com>, Edgar Iglesias <edgari@xilinx.com>, 
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 13 Oct 2021 07:13:17 -0000

On Thu, Sep 23, 2021 at 2:29 AM Damien Hedde <damien.hedde@greensocs.com> wrote:
>
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> Adding a new function is obviously not ideal. But there is ~900
> occurrences of memory_region_add_subregion[_overlap] calls in the code
> base. We do not really see an alternative here.
> ---
>  include/exec/memory.h | 22 ++++++++++++++++++++++
>  softmmu/memory.c      | 22 ++++++++++++++--------
>  2 files changed, 36 insertions(+), 8 deletions(-)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index c3d417d317..422e1eda67 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2162,6 +2162,28 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
>                                           MemoryRegion *subregion,
>                                           int priority);
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
>  /**
>   * memory_region_get_ram_addr: Get the ram address associated with a memory
>   *                             region
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index bfedaf9c4d..eac61f8236 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2513,22 +2513,28 @@ done:
>      memory_region_transaction_commit();
>  }
>
> -static void memory_region_add_subregion_common(MemoryRegion *mr,
> -                                               hwaddr offset,
> -                                               MemoryRegion *subregion)
> +bool memory_region_try_add_subregion(MemoryRegion *mr,
> +                                     hwaddr offset,
> +                                     MemoryRegion *subregion,
> +                                     int priority,
> +                                     Error **errp)
>  {
> -    assert(!subregion->container);
> +    if (subregion->container) {
> +        error_setg(errp, "The memory region is already in another region");
> +        return false;
> +    }
> +    subregion->priority = priority;
>      subregion->container = mr;
>      subregion->addr = offset;
>      memory_region_update_container_subregions(subregion);
> +    return true;
>  }
>
>  void memory_region_add_subregion(MemoryRegion *mr,
>                                   hwaddr offset,
>                                   MemoryRegion *subregion)
>  {
> -    subregion->priority = 0;
> -    memory_region_add_subregion_common(mr, offset, subregion);
> +    memory_region_try_add_subregion(mr, offset, subregion, 0, &error_abort);
>  }
>
>  void memory_region_add_subregion_overlap(MemoryRegion *mr,
> @@ -2536,8 +2542,8 @@ void memory_region_add_subregion_overlap(MemoryRegion *mr,
>                                           MemoryRegion *subregion,
>                                           int priority)
>  {
> -    subregion->priority = priority;
> -    memory_region_add_subregion_common(mr, offset, subregion);
> +    memory_region_try_add_subregion(mr, offset, subregion, priority,
> +                                    &error_abort);
>  }
>
>  void memory_region_del_subregion(MemoryRegion *mr,
> --
> 2.33.0
>
>

