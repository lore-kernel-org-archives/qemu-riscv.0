Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kAvfM-0002he-A4
	for mharc-qemu-riscv@gnu.org; Wed, 26 Aug 2020 09:40:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kAqR5-0000B0-W3
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2020 04:05:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kAqR4-0004bI-8m
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2020 04:05:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598429133;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qFDWzhffgHT0QS8qC9AD7o9JYYlIaLMf7gtouYw5uzA=;
 b=jVKMk8fzn4RHI+ljAUw7Fkaz3MOpkAgqO70VTT8IpEOWGczypb5PtMhjjsMLdN0kwOeywG
 co2f2vRBrzhCI68s4DD6zRyGBbDPEbWBVonrb+aNXK/KNAJtQKP1dyaRMkTsEa09kFnQzP
 3Bz7dk3MHGPCZSn6s4G4XDuAUiOEwXM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-cQ-l_gz4NwqwFTVIwnjafQ-1; Wed, 26 Aug 2020 04:05:31 -0400
X-MC-Unique: cQ-l_gz4NwqwFTVIwnjafQ-1
Received: by mail-wr1-f72.google.com with SMTP id c17so231482wrt.12
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2020 01:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NImKQq5ezsHefkpdy9SfbA9+4hFpj3XxE5AoedYCYBg=;
 b=WgrEUIQ5v7KBx6Cl8V81S/W6iJvAh0RunaplfyPyEQQZT46Qotct++UR8qanXuV4Dj
 NvK6lcDkVqjeyQZKVr8XKXoLT6cmtpU7hU9xboRsRWy5q5S9QAxXkdKqPsrERXbsJOla
 1uXtiHanlw2UB163FiLovp/3SO9+ms++v6ccv2AcKaS1NeChNgsPkOxz8uGa/P219Hii
 e1frAu0CusFDEkERCJtC3llJH43MxfgZ69raj0qcjfJI32/nWnfpcvjK/KvqvpT6IIaP
 46K/nT6+ovAee9OoZmcEEgn13lO6JdBp4VEygOrzMOo90DgwXMNWc0tzjGL0OgEyXUcI
 Mfqg==
X-Gm-Message-State: AOAM530IP1ZjLAxwMGKTeVtZF9CwHFchtx6M3nIqMgsoG74H+3y1FzhU
 qseFCzdfVPvfXfhATMGVLjy7rNzjMM12c+e7uVKuRTOumnlCfdwsVZGdMFa3Rz9WwsE/IEQDNx1
 at8ujMWPD+qrR0zA=
X-Received: by 2002:adf:eec4:: with SMTP id a4mr14022208wrp.325.1598429130568; 
 Wed, 26 Aug 2020 01:05:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgV0qEJw4SvfJJWICezdAreWgvFDuo0MZfhubnxoYYQuYepB/xRHiBkFBXO890vClnc3da7Q==
X-Received: by 2002:adf:eec4:: with SMTP id a4mr14022174wrp.325.1598429130323; 
 Wed, 26 Aug 2020 01:05:30 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id d11sm4063512wrw.77.2020.08.26.01.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 01:05:29 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,
 qemu-block@nongnu.org,  qemu-s390x@nongnu.org,  qemu-ppc@nongnu.org,
 kvm@vger.kernel.org,  xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH v3 64/74] [automated] Move QOM typedefs and add missing
 includes
In-Reply-To: <20200825192110.3528606-65-ehabkost@redhat.com> (Eduardo
 Habkost's message of "Tue, 25 Aug 2020 15:21:00 -0400")
References: <20200825192110.3528606-1-ehabkost@redhat.com>
 <20200825192110.3528606-65-ehabkost@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Wed, 26 Aug 2020 10:05:28 +0200
Message-ID: <87o8mxygqf.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 23:30:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 26 Aug 2020 09:40:38 -0400
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
X-List-Received-Date: Wed, 26 Aug 2020 08:05:36 -0000


[dropped people from CC]

Eduardo Habkost <ehabkost@redhat.com> wrote:
> Some typedefs and macros are defined after the type check macros.
> This makes it difficult to automatically replace their
> definitions with OBJECT_DECLARE_TYPE.
>
> Patch generated using:
>
>  $ ./scripts/codeconverter/converter.py -i \
>    --pattern=3DQOMStructTypedefSplit $(git grep -l '' -- '*.[ch]')
>
> which will split "typdef struct { ... } TypedefName"
> declarations.
>
> Followed by:
>
>  $ ./scripts/codeconverter/converter.py -i --pattern=3DMoveSymbols \
>     $(git grep -l '' -- '*.[ch]')
>
> which will:
> - move the typedefs and #defines above the type check macros
> - add missing #include "qom/object.h" lines if necessary
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes v2 -> v3:
> * Removed hunks due to rebase conflicts: hw/arm/integratorcp.c
>   hw/arm/versatilepb.c hw/arm/vexpress.c hw/sd/pl181.c
>   include/hw/ppc/xive.h
> * Removed hunks due to conflicts with other patches in this
>   series: include/hw/block/swim.h include/hw/display/macfb.h
>   include/hw/rdma/rdma.h migration/migration.h
>   target/rx/cpu-qom.h
> * Reviewed-by line from Daniel was kept, as no additional hunks
>   are introduced in this version
>
> Changes v1 -> v2:
> * Re-ran script after moving a few macros and typedefs.  Now the
>   patch also changes:
>   - SysbusAHCIState at hw/ide/ahci.h
>   - VhostUserGPU at hw/virtio/virtio-gpu.h
>   - I8257State at hw/dma/i8257.h
>   - AllwinnerAHCIState at hw/ide/ahci.h
>   - ISAKBDState at hw/input/i8042.h
>   - PIIXState at hw/southbridge/piix.h
>   - VFIOPCIDevice at hw/vfio/pci.h
>   - missing include at hw/net/rocker/rocker.h
>   - missing include at hw/scsi/mptsas.h
>   - missing include at include/hw/arm/pxa.h
>   - missing include at include/sysemu/kvm.h
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

> diff --git a/migration/rdma.c b/migration/rdma.c
> index 15ad985d26..e3eac913bc 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -35,6 +35,7 @@
>  #include <arpa/inet.h>
>  #include <rdma/rdma_cma.h>
>  #include "trace.h"
> +#include "qom/object.h"
> =20
>  /*
>   * Print and error on both the Monitor and the Log file.
> @@ -397,10 +398,10 @@ typedef struct RDMAContext {
>  } RDMAContext;
> =20
>  #define TYPE_QIO_CHANNEL_RDMA "qio-channel-rdma"
> +typedef struct QIOChannelRDMA QIOChannelRDMA;
>  #define QIO_CHANNEL_RDMA(obj)                                     \
>      OBJECT_CHECK(QIOChannelRDMA, (obj), TYPE_QIO_CHANNEL_RDMA)
> =20
> -typedef struct QIOChannelRDMA QIOChannelRDMA;
> =20
> =20
>  struct QIOChannelRDMA {

Reviewed-by: Juan Quintela <quintela@redhat.com>


