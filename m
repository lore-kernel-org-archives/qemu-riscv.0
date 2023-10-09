Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D136CE95A91
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 12:54:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qpplg-0005T5-Af; Mon, 09 Oct 2023 08:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1qpplO-0005OH-Bi
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 08:53:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1qpplI-0000VL-JJ
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 08:53:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696856007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qi6kaZehqIRaIGFLsRAH4lSxs1FJNj5QnwgA1vmVQBI=;
 b=G+WL4xDSQpb030/z7HPSYxPeLmM1YdUBqTsRe8Xvrz2pk4SCdSzhmJ925jeH1yqlPF1jPO
 MNei3iVyAmj898XOHoo44BKHGhMuCUxQ6HutpQWGCL8OL8UutxdTVlH62tci083DVfWNe1
 pNnfKAdB2rqJczofwx0tjg7rOtd5PVs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-TR3U-7PQN-OMLLzUR9NXAQ-1; Mon, 09 Oct 2023 08:53:22 -0400
X-MC-Unique: TR3U-7PQN-OMLLzUR9NXAQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25519810BDD;
 Mon,  9 Oct 2023 12:53:22 +0000 (UTC)
Received: from localhost (unknown [10.42.28.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6EA610005D4;
 Mon,  9 Oct 2023 12:53:21 +0000 (UTC)
Date: Mon, 9 Oct 2023 13:53:21 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, pbonzini@redhat.com
Subject: Re: [PATCH v2] target/riscv: Use a direct cast for better performance
Message-ID: <20231009125321.GR7636@redhat.com>
References: <20231008215147.3362612-1-rjones@redhat.com>
 <20231008215147.3362612-2-rjones@redhat.com>
 <50894b0f-effe-4e0d-81a9-51dc24a05489@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50894b0f-effe-4e0d-81a9-51dc24a05489@linux.alibaba.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=rjones@redhat.com;
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Mon, Oct 09, 2023 at 08:36:28PM +0800, LIU Zhiwei wrote:
> 
> On 2023/10/9 5:50, Richard W.M. Jones wrote:
> >RISCV_CPU(cs) uses a checked cast.  When QOM cast debugging is enabled
> >this adds about 5% total overhead when emulating RV64 on x86-64 host.
> >
> >Using a RISC-V guest with 16 vCPUs, 16 GB of guest RAM, virtio-blk
> >disk.  The guest has a copy of the qemu source tree.  The test
> >involves compiling the qemu source tree with 'make clean; time make -j16'.
> >
> >Before making this change the compile step took 449 & 447 seconds over
> >two consecutive runs.
> >
> >After making this change, 428 & 422 seconds.
> >
> >The saving is about 5%.
> >
> >Thanks: Paolo Bonzini
> >Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> >Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> >---
> >  target/riscv/cpu_helper.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> >diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> >index 3a02079290..479d9863ae 100644
> >--- a/target/riscv/cpu_helper.c
> >+++ b/target/riscv/cpu_helper.c
> >@@ -66,7 +66,11 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
> >                            uint64_t *cs_base, uint32_t *pflags)
> >  {
> >      CPUState *cs = env_cpu(env);
> >-    RISCVCPU *cpu = RISCV_CPU(cs);
> >+    /*
> >+     * Using the checked cast RISCV_CPU(cs) imposes ~ 5% overhead when
> >+     * QOM cast debugging is enabled, so use a direct cast instead.
> >+     */
> >+    RISCVCPU *cpu = (RISCVCPU *)cs;
> 
> This function is very hot. Maybe we should cache the tbflags instead
> of calculate it here. Otherwise,

This function is indeed very hot, taking over 20% of total host time
in my guest stress test.

How would we cache the flags?  AIUI they simply depend on machine
state and we must recalculate them either when the machine state
changes (sprinkle "update_tbflags" everywhere) or here.  If you have
any suggestions I can try things.

> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

I posted a v3 based on Philippe's feedback.

Rich.

> Zhiwei
> 
> >      RISCVExtStatus fs, vs;
> >      uint32_t flags = 0;

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW


