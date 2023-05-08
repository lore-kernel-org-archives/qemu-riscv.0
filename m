Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pvvTR-0003TY-4p
	for mharc-qemu-riscv@gnu.org; Mon, 08 May 2023 03:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pvvTP-0003TG-TC
 for qemu-riscv@nongnu.org; Mon, 08 May 2023 03:39:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pvvTN-0002ob-N1
 for qemu-riscv@nongnu.org; Mon, 08 May 2023 03:39:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683531592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kQwHAJ+6rNw2E0iImK30+c/dUgtLShaXatrIAYOgpBc=;
 b=aLds4p7CIa4sUx10szverN5QZCC7396TMvadkr5LqGPgyDzgaScZurSOPzQkoq1jKf6atp
 0c+g7vzjNPNvxEkgWnqomoirurBIsBKQ2KSQEh0/ZTsA/eU7DD4Q7lmorhOYQjjrz3E+By
 gCPST5c8j/17rMIsqDU3y7r0Fnw38jI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-m7zSntIsM8GYwhlbz8Rj1w-1; Mon, 08 May 2023 03:39:48 -0400
X-MC-Unique: m7zSntIsM8GYwhlbz8Rj1w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F21F385A5B1;
 Mon,  8 May 2023 07:39:47 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92F562026D16;
 Mon,  8 May 2023 07:39:47 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>, Yong-Xuan Wang
 <yongxuan.wang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rkanwal@rivosinc.com,
 anup@brainfault.org, dbarboza@ventanamicro.com, atishp@atishpatra.org,
 vincent.chen@sifive.com, greentime.hu@sifive.com, frank.chang@sifive.com,
 jim.shu@sifive.com, "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>, Avihai Horon
 <avihaih@nvidia.com>, Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org
Subject: Re: [PTACH v2 1/6] update-linux-headers: sync-up header with Linux
 for KVM AIA support
In-Reply-To: <20230505101707.495251a2.alex.williamson@redhat.com>
Organization: Red Hat GmbH
References: <20230505113946.23433-1-yongxuan.wang@sifive.com>
 <20230505113946.23433-2-yongxuan.wang@sifive.com>
 <20230505101707.495251a2.alex.williamson@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 08 May 2023 09:39:46 +0200
Message-ID: <878rdze0fx.fsf@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 08 May 2023 07:39:56 -0000

On Fri, May 05 2023, Alex Williamson <alex.williamson@redhat.com> wrote:

> On Fri,  5 May 2023 11:39:36 +0000
> Yong-Xuan Wang <yongxuan.wang@sifive.com> wrote:
>
>> Update the linux headers to get the latest KVM RISC-V headers with AIA support
>> by the scripts/update-linux-headers.sh.
>> The linux headers is comes from the riscv_aia_v1 branch available at
>> https://github.com/avpatel/linux.git. It hasn't merged into the mainline kernel.
>
> Updating linux-headers outside of code accepted to mainline gets a down
> vote from me.  This sets a poor precedent and can potentially lead to
> complicated compatibility issues.  Thanks,
>
> Alex

Indeed, this needs to be clearly marked as a placeholder patch, and
replaced with a proper header sync after the changes hit the mainline
kernel.


