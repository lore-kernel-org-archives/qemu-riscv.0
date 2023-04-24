Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqyix-0004UA-LA
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 12:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pqyiw-0004To-P3
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 12:07:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pqyiu-0000a5-R2
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 12:07:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682352448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wNwreOSwlYhvCShYoTkByj025paHY17QQ0wsTtVjClE=;
 b=F6hYvCFpZYc0Qwv9ClnMAVCgMU0EtHRVmzcgtFXuhkGVFPVwmcsQALpIE/FMLo0GinKES9
 tDIbZ48qdpGb6cnKirAHT/6c6zsCwQIDem/Vywu6GLuIE3A6ig2cMlVoT0s4lqgl5yE5Xu
 vq1nIQ2jRzWRqhZXT2ah7MGmvFxUOrs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-byC_9jHaMTOE2fXpUySfBg-1; Mon, 24 Apr 2023 12:07:23 -0400
X-MC-Unique: byC_9jHaMTOE2fXpUySfBg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B452788B7A1;
 Mon, 24 Apr 2023 16:07:22 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 268D0C15BA0;
 Mon, 24 Apr 2023 16:07:22 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>, Yong-Xuan Wang
 <yongxuan.wang@sifive.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, dbarboza@ventanamicro.com,
 atishp@atishpatra.org, vincent.chen@sifive.com, greentime.hu@sifive.com,
 frank.chang@sifive.com, "Michael S. Tsirkin" <mst@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng
 <bin.meng@windriver.com>, Chenyi Qiang <chenyi.qiang@intel.com>, Alex
 Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org
Subject: Re: [PATCH 1/6] update-linux-headers: sync-up header with Linux for
 KVM AIA support
In-Reply-To: <fa91e8cf-2240-ac81-740b-b9d8597f4f59@redhat.com>
Organization: Red Hat GmbH
References: <20230424090716.15674-1-yongxuan.wang@sifive.com>
 <20230424090716.15674-2-yongxuan.wang@sifive.com>
 <fa91e8cf-2240-ac81-740b-b9d8597f4f59@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 24 Apr 2023 18:07:20 +0200
Message-ID: <87edo9uuvb.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 24 Apr 2023 16:07:31 -0000

On Mon, Apr 24 2023, Thomas Huth <thuth@redhat.com> wrote:

> On 24/04/2023 11.07, Yong-Xuan Wang wrote:
>> Sync-up Linux header to get latest KVM RISC-V headers having AIA support.
>> 
>> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
>> Reviewed-by: Jim Shu <jim.shu@sifive.com>
>> ---
>>   linux-headers/linux/kvm.h |  2 ++
>>   target/riscv/kvm_riscv.h  | 33 +++++++++++++++++++++++++++++++++
>
>   Hi!
>
> Please don't mix updates to linux-headers/ with updates to other files. 
> linux-headers/ should only by updated via the 
> scripts/update-linux-headers.sh script, and then the whole update should be 
> included in the patch, not only selected files.

...and in the cases where you cannot run a normal headers update because
the code has not been accepted into Linux yet, just create a placeholder
patch containing only the linux-headers changes, which can be replaced
with a proper update later.

[I didn't check whether the code is already included in Linux.]


