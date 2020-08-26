Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kAvfM-0002i5-GI
	for mharc-qemu-riscv@gnu.org; Wed, 26 Aug 2020 09:40:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kAqNz-0006Ir-6m
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2020 04:02:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51605
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kAqNx-0004B1-46
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2020 04:02:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598428940;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IceReS5urR7oxiq7JZofugZ7vn307giG56gUhEw1ORE=;
 b=G85yRBtC9WNE2L1tsuW0egqhnJSml41l42lJdOx2ijvmyULQFxokkTTJXgYL7nhPPbZqFg
 3joNRE3TzgSmlJMssHexNx+FFkBlHoJ+8mqJuAJgnfH/vO4Ek9msqwc5vXYceKM+HwV+l5
 T6vd5vgQZRvMkFSnuN38zTpicF9cGug=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-P6GnrB29MgqZClOoD6Iziw-1; Wed, 26 Aug 2020 04:02:18 -0400
X-MC-Unique: P6GnrB29MgqZClOoD6Iziw-1
Received: by mail-wm1-f70.google.com with SMTP id x81so459100wmg.8
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2020 01:02:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G+cLFL8yEdkBH3yow4+6ZbZvxrDo8zepFhkkyNnP2kg=;
 b=n/9uCsbrbwAn8aigCAxb5fOXyp6y9aZsXexnBco2izMPHytoL/UJWT/gAXXCUNC2Io
 1Axv4PwagthjrHgK0sxk49FXIJfVcpub+bnpYiwMsemeG8sxl9er3j/atED3CvXHeG7W
 AYQ5K6T4EuNOeQCWS5/VEqdJiyxUo/9eqhnkLc3ZWtWK+EkkNdcL4wUxx0W91gB6OwrQ
 P3xz1CSuD+1MaCiP/ShW3ps0U47+JJ91hfZJisjGY5RAIoINkdGSkRLNN9ioBWW9I/Sv
 P8p+CidwzltvvgzOxnnRYSReZHfdodY/Yvgd+FCNw8QR7GCLfaAmdHAd8Ry7UPc39ZSD
 SaHw==
X-Gm-Message-State: AOAM533HnrfGS6b+/JcD+QKb/kO6VvooFOm0fC7G1zPBDaQ0XmfGnegc
 WC80qrR4sBQ7LE9e8CCb5hsmnj9RUcE6wAPCKi/nfi4fVpmKIqxs+tWAUdfPfdIzvuGO51ev/Sc
 OIk7mTodUZ/sV8lg=
X-Received: by 2002:adf:b1cf:: with SMTP id r15mr15309320wra.118.1598428937450; 
 Wed, 26 Aug 2020 01:02:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTUhdcIpNRU3VUvS4tp1AIY+Oz9N9C9qsavDdUBCjRbYqMLCYnQmaNkxYRTh7m6m1+LgttHA==
X-Received: by 2002:adf:b1cf:: with SMTP id r15mr15309298wra.118.1598428937244; 
 Wed, 26 Aug 2020 01:02:17 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id o2sm3715968wrj.21.2020.08.26.01.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 01:02:16 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org,  qemu-block@nongnu.org,
 qemu-arm@nongnu.org,  qemu-riscv@nongnu.org,  qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,  haxm-team@intel.com
Subject: Re: [PATCH v3 62/74] [automated] Use TYPE_INFO macro
In-Reply-To: <20200825192110.3528606-63-ehabkost@redhat.com> (Eduardo
 Habkost's message of "Tue, 25 Aug 2020 15:20:58 -0400")
References: <20200825192110.3528606-1-ehabkost@redhat.com>
 <20200825192110.3528606-63-ehabkost@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Wed, 26 Aug 2020 10:02:15 +0200
Message-ID: <87y2m1ygvs.fsf@secure.mitica>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 26 Aug 2020 08:02:23 -0000

Eduardo Habkost <ehabkost@redhat.com> wrote:
> Generated using:
>   $ ./scripts/codeconverter/converter.py -i --passes=3D2 \
>     --pattern=3DTypeRegisterCall,TypeInitMacro $(git grep -l TypeInfo -- =
'*.[ch]')
>
> One notable difference is that files declaring multiple types
> will now have multiple separate __construtor__ functions
> declared, instead of one for all types.
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes v2 -> v3:
> * Removed hunks due to rebase conflicts:
>   hw/sd/milkymist-memcard.c hw/sd/pl181.c
> * Reviewed-by line from Daniel was kept, as no additional hunks
>   are introduced in this version
>
> Changes v1 -> v2:
> * Add note about multiple constructor functions to commit message
>   (suggested by Daniel)
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

[ I removed CC'd people, -ETOOMANYRECIPIENTS]

....

> diff --git a/migration/migration.c b/migration/migration.c
> index dbd4afa1e8..561e2ae697 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3844,10 +3844,6 @@ static const TypeInfo migration_type =3D {
>      .instance_init =3D migration_instance_init,
>      .instance_finalize =3D migration_instance_finalize,
>  };
> +TYPE_INFO(migration_type)
> =20
> -static void register_migration_types(void)
> -{
> -    type_register_static(&migration_type);
> -}
> =20
> -type_init(register_migration_types);
> diff --git a/migration/rdma.c b/migration/rdma.c
> index bea6532813..15ad985d26 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -3942,13 +3942,9 @@ static const TypeInfo qio_channel_rdma_info =3D {
>      .instance_finalize =3D qio_channel_rdma_finalize,
>      .class_init =3D qio_channel_rdma_class_init,
>  };
> +TYPE_INFO(qio_channel_rdma_info)
> =20
> -static void qio_channel_rdma_register_types(void)
> -{
> -    type_register_static(&qio_channel_rdma_info);
> -}
> =20
> -type_init(qio_channel_rdma_register_types);
> =20
>  static QEMUFile *qemu_fopen_rdma(RDMAContext *rdma, const char *mode)
>  {

For the migration bits.

Reviewed-by: Juan Quintela <quintela@redhat.com>


