Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CE6EB64DA
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 10:13:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFB70-0002qP-9Z; Fri, 30 Jun 2023 06:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1qFB6w-0002hW-Gl
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 06:12:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1qFB6u-0001PM-Q4
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 06:12:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688119935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GJnG5qQNzK5f1dQ5KBCwnGhfQBb6PVZfr3fE+pEYwUw=;
 b=etusAHFHZ2jF7NqqO9mxNc7SWEiGG50ffxsuR7o7OGQl8ADRklVGGKQwYuH620b8zOr4VM
 IsNRfLELN+ImYOSeUVY5pDOr0o0h4J73EpUPyo/KBr2sfr2RWBJHWkRhmC9/W9Yzo+QK4v
 zfsFmCDxa1aSZOA9FzUvVsF+tAPhQ0I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-HV3rX0wFOKqO0FPwqzWaiQ-1; Fri, 30 Jun 2023 06:12:11 -0400
X-MC-Unique: HV3rX0wFOKqO0FPwqzWaiQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1769185A792;
 Fri, 30 Jun 2023 10:12:10 +0000 (UTC)
Received: from localhost (unknown [10.39.193.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DB9F200A3AD;
 Fri, 30 Jun 2023 10:12:10 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Yong-Xuan Wang
 <yongxuan.wang@sifive.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, atishp@atishpatra.org,
 vincent.chen@sifive.com, greentime.hu@sifive.com, frank.chang@sifive.com,
 jim.shu@sifive.com, "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Peter Xu <peterx@redhat.com>, kvm@vger.kernel.org
Subject: Re: [PATCH v4 1/6] update-linux-headers: sync-up header with Linux
 for KVM AIA support placeholder
In-Reply-To: <e21ea550-20f6-257b-549d-75b1d5efe0a1@ventanamicro.com>
Organization: Red Hat GmbH
References: <20230621145500.25624-1-yongxuan.wang@sifive.com>
 <20230621145500.25624-2-yongxuan.wang@sifive.com>
 <e21ea550-20f6-257b-549d-75b1d5efe0a1@ventanamicro.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Fri, 30 Jun 2023 12:11:57 +0200
Message-ID: <874jmp45ua.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Fri, Jun 30 2023, Daniel Henrique Barboza <dbarboza@ventanamicro.com> wrote:

> On 6/21/23 11:54, Yong-Xuan Wang wrote:
>> Sync-up Linux header to get latest KVM RISC-V headers having AIA support.
>> 
>> Note: This is a placeholder commit and could be replaced when all referenced Linux patchsets are mainlined.
>> 
>> The linux-headers changes are from 2 different patchsets.
>> [1] https://lore.kernel.org/lkml/20230404153452.2405681-1-apatel@ventanamicro.com/
>> [2] https://www.spinics.net/lists/kernel/msg4791872.html
>
>
> It looks like Anup sent a PR for [2] for Linux 6.5. IIUC this would be then a 6.5
> linux-header update.
>
> In this case I'm not sure whether we can pick this up for QEMU 8.1 (code freeze is
> July 10th) since we can't keep a 6.5 placeholder header. I'll let Alistair comment
> on that.

My crystal ball says that we'll have Linux 6.5-rc1 on July 9th, which
is... probably too late, given the need for a repost with a proper
headers update etc. (I'd generally prefer not to do the headers update
on a random middle-of-the-merge-window commit...)


