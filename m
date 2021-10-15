Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbMEs-0008Q5-Pr
	for mharc-qemu-riscv@gnu.org; Fri, 15 Oct 2021 08:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mbMEe-0008Nt-2H
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 08:22:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mbMES-0005Ap-BN
 for qemu-riscv@nongnu.org; Fri, 15 Oct 2021 08:22:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634300551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X+x9BScqdGty8iclCmqSRltRG2OtvTpe4Lmba3DYdls=;
 b=LZTbraSsDBwN9E6Ue/8xoZp9Y/mtqBnuj3ZxEZu5URUGKoq8Yvv+Yc6eyraLn6BewUAmgr
 I6wVOjSAFtphckR+woIjjO4RRiYwfkOS7B3Aa03YTrBiCxFiiAQ16paoD2C18c50kXiNQx
 F4bP91hS7Vwt2Fgc2gZrQ+uL6XY/J58=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-XHkyaeKSMFeAwuv5kmI-JA-1; Fri, 15 Oct 2021 08:22:29 -0400
X-MC-Unique: XHkyaeKSMFeAwuv5kmI-JA-1
Received: by mail-wr1-f71.google.com with SMTP id
 c4-20020a5d6cc4000000b00160edc8bb28so5871548wrc.9
 for <qemu-riscv@nongnu.org>; Fri, 15 Oct 2021 05:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X+x9BScqdGty8iclCmqSRltRG2OtvTpe4Lmba3DYdls=;
 b=qyHsT1P185uNbyHphgjdosXAjUaVgb5fE0T378TqJWmi3d9ao9mG3b2aRv2S6ycg3E
 bTHXKErNBjMFdX3cMm1sPsjruU+KZ33cNnUwm+GEQ5V758bwsbI9uwpGDxGcfUSH+FEZ
 Glwffy3XtRQ7aAZHoB17MxXjvenOsHgjrYFGyiRTQjdtxrLuz5N40+EX7lfvCKwBpuhp
 YXdkruC+7EAXwf2NJnE6NyTeO59cZJkHKR3VB1rAw5oyu0I1ij3eIjXm4trboRjDwdsU
 frhmCrhhURiaWKkBnW3d3JnG7+iQ40aRmdzpFUFn/d26cQNKispPVKqQI1N/8+GUgg1q
 5DYw==
X-Gm-Message-State: AOAM531pS5x1T2bo4VF1RC1PBj9EKXUJhrVGpgR/4BVhQimSY70EprRo
 bewNgIM7v16k5bsWj5i1DDJIdA8vYFcpP75qCvjxp4lnQrC3aiXb2HJ6V31KG58+kfPKRJXtrNL
 pcOuxnWQ0hNl7GLQ=
X-Received: by 2002:a7b:c856:: with SMTP id c22mr25723741wml.116.1634300548820; 
 Fri, 15 Oct 2021 05:22:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx64OJFXv9IchRxtt9mt+lpQey81+rRAmgdKqoiPQdaz3onxDB2glHbQ42QCtsfEx2Zja8Ukg==
X-Received: by 2002:a7b:c856:: with SMTP id c22mr25723696wml.116.1634300548422; 
 Fri, 15 Oct 2021 05:22:28 -0700 (PDT)
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id d24sm4496850wmb.35.2021.10.15.05.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 05:22:28 -0700 (PDT)
Date: Fri, 15 Oct 2021 14:22:26 +0200
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 imammedo@redhat.com, ehabkost@redhat.com, robh@kernel.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: Re: [PATCH v4] hw/arm/virt: Don't create device-tree node for empty
 NUMA node
Message-ID: <20211015122226.g42zu7hsbc2fey27@gator>
References: <20211015104909.16722-1-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211015104909.16722-1-gshan@redhat.com>
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
X-List-Received-Date: Fri, 15 Oct 2021 12:22:55 -0000

On Fri, Oct 15, 2021 at 06:49:09PM +0800, Gavin Shan wrote:
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
> map. As the memory hotplug through device-tree on ARM64 isn't existing
> so far, it's pointless to expose the empty NUMA nodes through device-tree.

Instead of "it's pointless to expose the empty NUMA nodes through
device-tree", how about

 it's not necessary to require the user to provide a distance map.
 Furthermore, the default distance map Linux generates may even be
 sufficient.

> So this simply skips populating the device-tree nodes for these empty
> NUMA nodes to avoid the error, so that QEMU can be started successfully.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
> v4: Drop patch to enforce distance-map as memory hotplug through
>     device-tree is never supported on ARM64. It's pointless to
>     expose these empty NUMA nodes. Besides, comments added to
>     explain the code changes included in this patch as Drew
>     suggested.
> ---
>  hw/arm/boot.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 57efb61ee4..e05c1c149c 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -599,10 +599,24 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>      }
>      g_strfreev(node_path);
>  
> +    /*
> +     * According to Linux NUMA binding document, the device tree nodes
> +     * for the empty NUMA nodes shouldn't be generated, but their NUMA
> +     * node IDs should be included in the distance map instead. However,
> +     * it's pointless to expose the empty NUMA nodes as memory hotplug
> +     * through device tree is never supported. We simply skip generating
> +     * their device tree nodes to avoid the unexpected device tree
> +     * generating failure due to the duplicated names of these empty
> +     * NUMA nodes.
> +     */

    /*
     * We drop all the memory nodes which correspond to empty NUMA nodes from
     * the device tree, because the Linux NUMA binding document states they
     * should not be generated.  Linux will get the NUMA node IDs of the empty
     * NUMA nodes from the distance map if they are needed.  This means QEMU
     * users may be obliged to provide command lines which configure distance
     * maps when the empty NUMA node IDs are needed and Linux's default
     * distance map isn't sufficient.
     */



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

Thanks,
drew 


