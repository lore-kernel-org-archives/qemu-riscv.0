Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbN0I-0005o1-FJ
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 09:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mbN0H-0005m8-Gw
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 09:12:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mbN0D-0006jw-LO
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 09:12:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634303520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W0vF/9MOHDdbNvj86iC32K81uqQYwjSBac8qQjNB6CA=;
 b=X32uhHqKwjxgh3z7YHj51z1qI/LWtyRjx0dZc7leD3dSQm8FyXkNVe/2Z9qRmF6CcwU2MH
 GYO/zyDLuWk+5wrZDbla95Zivs48WDTpf/GsydvXTsV6j98ZX/yMvFGeb1+1uwLZMH1Y/i
 Q8bDD/n9pCsu7wO7m2RA4wEShG6v2Xs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-2cedxwQcMB-7KXU5Ib_8Dg-1; Fri, 15 Oct 2021 09:11:58 -0400
X-MC-Unique: 2cedxwQcMB-7KXU5Ib_8Dg-1
Received: by mail-wm1-f69.google.com with SMTP id
 k9-20020a7bc409000000b0030d978403e9so660902wmi.7
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 06:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=W0vF/9MOHDdbNvj86iC32K81uqQYwjSBac8qQjNB6CA=;
 b=cvlR0A9OJRoEIx+K+hKZdRP/Cdfn+qNbgL/Z0shuBYOmhaUh++0N7Gm5KiiNg/fltQ
 Tj/Wscj1YBcs/pnfi6FmitXR5a7Xx8MVFIRn1gLob1CsFunuxdGTOwFWDfo2iiO6YdRa
 y+cu0EZ5xB+KiwmNOw4gnznHeBj/5VsOc8i9kITfdbRO/wZM2FRiQuFqN5pK/8ID3j4+
 QYR1IoEISCYIH4xSXvSDKWPkKfc09L2TSBUIRHJhLZ2NXEoTYwnF8cQfowuyzY/U12Ww
 3NyowVM2cvWMXKH0oImXUoE8f6I666HTa/pm7K3lr9MCapuSjqEqKQdKA3WDe92lJpD9
 VI4A==
X-Gm-Message-State: AOAM53323PWWrhyBsebYf5ZavDhCGl3V0FdZtcMqA/fvAyKfkQs9wKof
 ZhjDzHDtUycAp5xpqW0OXLBrWI1p+bDFH4k6bG2Fj9fDdvyqxaciyi8MFuJD1FDHrNYCN4WyG7r
 vYIkITKKVk/Y2uV8=
X-Received: by 2002:a05:600c:17ca:: with SMTP id
 y10mr26520935wmo.62.1634303517527; 
 Fri, 15 Oct 2021 06:11:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxH/RPkL0k/On5M8a5PrYVwxDtVsHMvBBQwj8qKqU+ySK9grorAZioCN5F694iVRK8Txf7rNg==
X-Received: by 2002:a05:600c:17ca:: with SMTP id
 y10mr26520899wmo.62.1634303517258; 
 Fri, 15 Oct 2021 06:11:57 -0700 (PDT)
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id j16sm4955421wms.16.2021.10.15.06.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 06:11:56 -0700 (PDT)
Date: Fri, 15 Oct 2021 15:11:55 +0200
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 imammedo@redhat.com, ehabkost@redhat.com, robh@kernel.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: Re: [PATCH v5] hw/arm/virt: Don't create device-tree node for empty
 NUMA node
Message-ID: <20211015131155.jkxapvfvrlteo4k7@gator>
References: <20211015124246.23073-1-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211015124246.23073-1-gshan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 15 Oct 2021 13:12:05 -0000

On Fri, Oct 15, 2021 at 08:42:46PM +0800, Gavin Shan wrote:
> The empty NUMA node, where no memory resides, are allowed. For
> example, the following command line specifies two empty NUMA nodes.
> With this, QEMU fails to boot because of the conflicting device-tree
> node names, as the following error message indicates.
> 
>   /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>   -accel kvm -machine virt,gic-version=host               \
>   -cpu host -smp 4,sockets=2,cores=2,threads=1            \
>   -m 1024M,slots=16,maxmem=64G                            \
>   -object memory-backend-ram,id=mem0,size=512M            \
>   -object memory-backend-ram,id=mem1,size=512M            \
>   -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
>   -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
>   -numa node,nodeid=2                                     \
>   -numa node,nodeid=3
>     :
>   qemu-system-aarch64: FDT: Failed to create subnode /memory@80000000: FDT_ERR_EXISTS
> 
> As specified by linux device-tree binding document, the device-tree
> nodes for these empty NUMA nodes shouldn't be generated. However,
> the corresponding NUMA node IDs should be included in the distance
> map. The memory hotplug through device-tree on ARM64 isn't existing
> so far and it's not necessary to require the user to provide a distance
> map. Furthermore, the default distance map Linux generates may even be
> sufficient. So this simply skips populating the device-tree nodes for
> these empty NUMA nodes to avoid the error, so that QEMU can be started
> successfully.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
> v5: Improved commit log and comments as Drew suggested.
> ---
>  hw/arm/boot.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 57efb61ee4..74ad397b1f 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -599,10 +599,23 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>      }
>      g_strfreev(node_path);
>  
> +    /*
> +     * We drop all the memory nodes which correspond to empty NUMA nodes
> +     * from the device tree, because the Linux NUMA binding document
> +     * states they should not be generated. Linux will get the NUMA node
> +     * IDs of the empty NUMA nodes from the distance map if they are needed.
> +     * This means QEMU users may be obliged to provide command lines which
> +     * configure distance maps when the empty NUMA node IDs are needed and
> +     * Linux's default distance map isn't sufficient.
> +     */
>      if (ms->numa_state != NULL && ms->numa_state->num_nodes > 0) {
>          mem_base = binfo->loader_start;
>          for (i = 0; i < ms->numa_state->num_nodes; i++) {
>              mem_len = ms->numa_state->nodes[i].node_mem;
> +            if (!mem_len) {
> +                continue;
> +            }
> +
>              rc = fdt_add_memory_node(fdt, acells, mem_base,
>                                       scells, mem_len, i);
>              if (rc < 0) {
> -- 
> 2.23.0
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


