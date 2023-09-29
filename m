Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2253AE7F153
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 10:38:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qmAt3-0001Od-VL; Fri, 29 Sep 2023 06:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qmAt2-0001O0-Fr
 for qemu-riscv@nongnu.org; Fri, 29 Sep 2023 06:38:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qmAt0-0005IJ-8e
 for qemu-riscv@nongnu.org; Fri, 29 Sep 2023 06:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695983889;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=TRzYPqDgsBjZa2wXO0MgNyW0z4duYgY1iykUgmn61+0=;
 b=FaUV3lnyMy4kFbyHm4SfNp8EesoWWoHrBTnCUxz9TYt3nvdg6H2rnJoIQKvQiwILu5VSA2
 Kfou0xYYEkfMv72LBBC8w9HoJymx1zTCaBrLqLsjoDKJvrrL3Jjp+Dmq9rzO0C8Csyz2ne
 FaY9Lf5ik9E3h2ok9vI7uwS1q+Wf/vs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-VY5OSm9UNv6Wj8rifWg3RA-1; Fri, 29 Sep 2023 06:38:06 -0400
X-MC-Unique: VY5OSm9UNv6Wj8rifWg3RA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CC0A811E7D;
 Fri, 29 Sep 2023 10:38:05 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96E5B2026D4B;
 Fri, 29 Sep 2023 10:38:03 +0000 (UTC)
Date: Fri, 29 Sep 2023 11:38:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH 2/2] target/riscv/tcg-cpu.c: add extension properties for
 all cpus
Message-ID: <ZRapCe9kGyw52bLS@redhat.com>
References: <20230926183109.165878-1-dbarboza@ventanamicro.com>
 <20230926183109.165878-3-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230926183109.165878-3-dbarboza@ventanamicro.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Sep 26, 2023 at 03:31:09PM -0300, Daniel Henrique Barboza wrote:
> At this moment we do not expose extension properties for vendor CPUs
> because that would allow users to change them via command line. The
> drawback is that if we were to add an API that shows all CPU properties,
> e.g. qmp-query-cpu-model-expansion, we won't be able to show extensions
> state of vendor CPUs.
> 
> We have the required machinery to create extension properties for vendor
> CPUs while not allowing users to enable extensions. Disabling existing
> extensions is allowed since it can be useful for debugging.
> 
> Change the set() callback cpu_set_multi_ext_cfg() to allow enabling
> extensions only for generic CPUs. In cpu_add_multi_ext_prop() let's not
> set the default values for the properties if we're not dealing with
> generic CPUs, otherwise the values set in cpu_init() of vendor CPUs will
> be overwritten. And finally, in tcg_cpu_instance_init(), add cpu user
> properties for all CPUs.
> 
> For the veyron-v1 CPU, we're now able to disable existing extensions
> like smstateen:
> 
> $ ./build/qemu-system-riscv64 --nographic -M virt \
>     -cpu veyron-v1,smstateen=false
> 
> But setting extensions that the CPU didn't set during cpu_init(), like
> V, is not allowed:
> 
> $ ./build/qemu-system-riscv64 --nographic -M virt \
>     -cpu veyron-v1,v=true
> qemu-system-riscv64: can't apply global veyron-v1-riscv-cpu.v=true:
>   'veyron-v1' CPU does not allow enabling extensions

Why should we block the user if they want to enable an extra
feature, over and above what is built-in to the CPU model ?
Is there some technical reason that prevents this from working ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


