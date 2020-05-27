Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jdqJJ-0000zo-0F
	for mharc-qemu-riscv@gnu.org; Wed, 27 May 2020 03:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jdqJH-0000yx-Ol
 for qemu-riscv@nongnu.org; Wed, 27 May 2020 03:17:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26386
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jdqJG-0005uR-0e
 for qemu-riscv@nongnu.org; Wed, 27 May 2020 03:17:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590563824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=fwt41HQxGw3q2WCw9tNQU1Rhs+h3NexY5fYjdEsej5M=;
 b=Iqop1PWS9C0hxz4S6V0Nvkn7ZnTSuMxfNik3Id/IsnpQrd6hhSkyhkj9dXFtSbHh/oAoR4
 aZqr8x1IKrcCEtOtTC0bVv0XfK1dQBXRscVTU9PKVg3B+dcPnDcA1bUJ0vHS8pHt6BkOu4
 VLbPQamAnSlYWCE+53QVJ1EgZvTVc8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-3HwwANu4O9KPg1e8sltlrA-1; Wed, 27 May 2020 03:17:02 -0400
X-MC-Unique: 3HwwANu4O9KPg1e8sltlrA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 190BEEC1AE;
 Wed, 27 May 2020 07:17:01 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-170.ams2.redhat.com [10.36.112.170])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85C0E7A8A0;
 Wed, 27 May 2020 07:16:58 +0000 (UTC)
Subject: Re: [PATCH v3 0/3] RTISC-V: Remove deprecated ISA, CPUs and machines
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: philmd@redhat.com, palmer@dabbelt.com, bmeng.cn@gmail.com,
 alistair23@gmail.com
References: <cover.1590533156.git.alistair.francis@wdc.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <0c7494fe-f812-9ee4-6c35-bc1991d0aff2@redhat.com>
Date: Wed, 27 May 2020 09:16:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cover.1590533156.git.alistair.francis@wdc.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/27 01:25:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 27 May 2020 07:17:08 -0000

On 27/05/2020 00.47, Alistair Francis wrote:
> 
>  include/hw/riscv/spike.h                      |   6 +-
>  target/riscv/cpu.h                            |   8 -
>  hw/riscv/spike.c                              | 217 ------------------
>  target/riscv/cpu.c                            |  30 ---
>  target/riscv/cpu_helper.c                     |  82 +++----
>  target/riscv/csr.c                            | 118 ++--------
>  .../riscv/insn_trans/trans_privileged.inc.c   |  18 +-
>  target/riscv/monitor.c                        |   5 -
>  target/riscv/op_helper.c                      |  17 +-
>  tests/qtest/machine-none-test.c               |   4 +-
>  10 files changed, 60 insertions(+), 445 deletions(-)

 Hi,

looking at the diffstat, I think you should also edit
./docs/system/deprecated.rst according to your changes?

 Thomas


