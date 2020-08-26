Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kAvfM-0002jJ-SW
	for mharc-qemu-riscv@gnu.org; Wed, 26 Aug 2020 09:40:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kAqUV-0003xJ-Vt
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2020 04:09:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47059
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kAqUT-0004xX-BT
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2020 04:09:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598429344;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WLP42d08jlqtDdnGGiR1ac66izB7N8sAvplYxoFxlws=;
 b=N0k1wnyj08k5oeTkDbhkDAJ1cqKjMNHLMW5RbUwqUhw7ClQ2uT6wrbf1ym6BlvzJOgZYBe
 wtyN64weHHpBLGaBI47tjN/OLRPPYz/IsgmJlA00Eu2AynIESdMbhUar8K71dApqCO/JPV
 HF3rn/ZGLrdBoJ5rebH8Dsy3FVvAJ/k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-s7PHlSO6MTyck4QpdW85tQ-1; Wed, 26 Aug 2020 04:09:02 -0400
X-MC-Unique: s7PHlSO6MTyck4QpdW85tQ-1
Received: by mail-wr1-f69.google.com with SMTP id l14so237648wrp.9
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2020 01:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kLIsu+nEc3aBl1VyG4Sd867PXkn1bWp9ManfPK6FPHs=;
 b=De2Zas7Y2R+dF5LS9l2Rlz6VwVlfPSzQ+uA5LFm2odgFlO56s+VEj3vKLqSQMV4LT1
 kTqfXaxviQOOANRvpfUhLjnCG9OWp9/ANEeD77QcrmpKQzdDWthWf03g0SyN1sDaL3c0
 +sNiMxQym6kOPgaO8WooOKVUNZkpPA6+pHDqPvvCeSiXspLP2mocsjHoORAabOmpbjFP
 dzZS6dWTOMfcmKadAYyM/5iI8JRCNi2BEkrIyXxhqRpWTKRTpck8hlHWasZg8On9Mvui
 1cKpXt9nihYt3k3crW/abNTb8/DypO/1UUvvckPr+kZmhJI6xaWBoypZ7q880po/jjC4
 Kv8w==
X-Gm-Message-State: AOAM5310Y7UgRutNhXZIye42UxflTLtkjqGWc8O+X3R2kNvBd2my31Cl
 kOOryV033t23jhXKb1qWmbp47ZMgFhCsFpLwmZzYvr5EnItoP+jnKQ12XNBM/Sogv9Nubfl/d8O
 PSLU81eAkm3mExDU=
X-Received: by 2002:adf:9e8d:: with SMTP id a13mr13566871wrf.94.1598429341765; 
 Wed, 26 Aug 2020 01:09:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzT9BIXEipC0KHHms1/LKk2MRcW/qT6UlqJ2yHzgxQ4Cz3Ybar/ud7Phbq6goZoBDpiyvRYng==
X-Received: by 2002:adf:9e8d:: with SMTP id a13mr13566848wrf.94.1598429341511; 
 Wed, 26 Aug 2020 01:09:01 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id z9sm3613141wmg.46.2020.08.26.01.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 01:09:00 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH v3 66/74] [automated] Use DECLARE_*CHECKER* macros
In-Reply-To: <20200825192110.3528606-67-ehabkost@redhat.com> (Eduardo
 Habkost's message of "Tue, 25 Aug 2020 15:21:02 -0400")
References: <20200825192110.3528606-1-ehabkost@redhat.com>
 <20200825192110.3528606-67-ehabkost@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Wed, 26 Aug 2020 10:08:59 +0200
Message-ID: <87ft89ygkk.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=quintela@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 03:56:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 26 Aug 2020 08:09:08 -0000

Eduardo Habkost <ehabkost@redhat.com> wrote:
>  $ ./scripts/codeconverter/converter.py -i \
>    --pattern=3DTypeCheckMacro $(git grep -l '' -- '*.[ch]')
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes v2 -> v3:
> * Removed hunks due to rebase conflicts:
>   hw/arm/integratorcp.c hw/arm/versatilepb.c hw/sd/pl181.c
>   include/hw/ppc/xive.h
> * Reviewed-by line from Daniel was kept, as no additional hunks
>   are introduced in this version

[Dropeed CC'd]

...

> diff --git a/migration/rdma.c b/migration/rdma.c
> index e3eac913bc..87cb277d05 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -399,8 +399,8 @@ typedef struct RDMAContext {
> =20
>  #define TYPE_QIO_CHANNEL_RDMA "qio-channel-rdma"
>  typedef struct QIOChannelRDMA QIOChannelRDMA;
> -#define QIO_CHANNEL_RDMA(obj)                                     \
> -    OBJECT_CHECK(QIOChannelRDMA, (obj), TYPE_QIO_CHANNEL_RDMA)
> +DECLARE_INSTANCE_CHECKER(QIOChannelRDMA, QIO_CHANNEL_RDMA,
> +                         TYPE_QIO_CHANNEL_RDMA)
> =20
> =20
> =20

Reviewed-by: Juan Quintela <quintela@redhat.com>


