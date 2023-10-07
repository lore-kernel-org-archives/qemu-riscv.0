Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79924E95A60
	for <qemu-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 09:10:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qp3K8-0004wg-Vd; Sat, 07 Oct 2023 05:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1qp3K7-0004wN-Fu
 for qemu-riscv@nongnu.org; Sat, 07 Oct 2023 05:10:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1qp3K5-0004PI-P6
 for qemu-riscv@nongnu.org; Sat, 07 Oct 2023 05:10:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696669808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RIuvfKyArEdfEoqTwGNmoxz0tw1Yz0HZDgrVWpi+FZc=;
 b=ZWejMR/DuiTD2J3wiEjkOhqz27VbuDKOCOHXLlnYuW+nmwIMn7EOmP7HflvksSI50XK/ih
 gRKiALYl8pKihGilq8bg1yMl3xfngWCC44h9WAkiU5+RTfstf1LkvczpJBAuaa5GYpfTOO
 KDTFqgF4dqdxqP1wQ1Bc8FJVmUSyL4w=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-o9paOJbJOkekM1EzE1ODXw-1; Sat, 07 Oct 2023 05:10:05 -0400
X-MC-Unique: o9paOJbJOkekM1EzE1ODXw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9420929A9D2A;
 Sat,  7 Oct 2023 09:10:04 +0000 (UTC)
Received: from localhost (unknown [10.42.28.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A2E61005B8E;
 Sat,  7 Oct 2023 09:10:04 +0000 (UTC)
Date: Sat, 7 Oct 2023 10:10:03 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 pbonzini@redhat.com
Subject: Re: [PATCH] target/riscv: Use a direct cast for better performance
Message-ID: <20231007091003.GA5507@redhat.com>
References: <20231007090232.3329594-1-rjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231007090232.3329594-1-rjones@redhat.com>
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

If you're interested in how I found this problem, it was done using
'perf report -a -g' & flamegraphs.  This is the flamegraph of qemu (on
the host) when the guest is running the parallel compile:

  http://oirase.annexia.org/tmp/qemu-riscv.svg

If you click into 'CPU_0/TCG' at the bottom left (all the vCPUs
basically act alike), and then go to 'cpu_get_tb_cpu_state' you can
see the call to 'object_dynamic_cast_assert' taking considerable time.

If you zoom out, hit Ctrl F and type 'object_dynamic_cast_assert' into
the search box then the flamegraph will tell you this call takes about
6.6% of total time (not all, but most, attributable to the call from
'cpu_get_tb_cpu_state' -> 'object_dynamic_cast_assert').

There are several other issues in the flamegraph which I'm trying to
address, but this was the simplest one.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html


