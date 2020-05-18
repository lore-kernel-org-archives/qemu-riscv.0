Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jaeff-000887-Gx
	for mharc-qemu-riscv@gnu.org; Mon, 18 May 2020 08:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jaefd-00086S-DA
 for qemu-riscv@nongnu.org; Mon, 18 May 2020 08:15:01 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49455
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jaefc-0005I1-43
 for qemu-riscv@nongnu.org; Mon, 18 May 2020 08:15:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589804097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HuoUku7otY8lzNDgk4DT2MIEC7umNArTKFEtMvFwoLE=;
 b=cGcHx/e2qvgqlVWlIT1vjWYTFGu32/2bfvFq60sLTD7SvEydAvu6/aS7vnbwttQc08qDaT
 eNPpoIT8QmN7eqG/EHjqp+6wYzvcUENXNmG15+J+oV5+vRRZnCY1wQSGyma9XLHjyileHM
 CAtk6Nqfurvof6i09dHLTCjQE9Q8RGU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-VM47gqQ6M5m6NR1oNhJ9ow-1; Mon, 18 May 2020 08:14:56 -0400
X-MC-Unique: VM47gqQ6M5m6NR1oNhJ9ow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C08A1108BD19;
 Mon, 18 May 2020 12:14:47 +0000 (UTC)
Received: from work-vm (ovpn-112-78.ams2.redhat.com [10.36.112.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DDD215D9DD;
 Mon, 18 May 2020 12:14:36 +0000 (UTC)
Date: Mon, 18 May 2020 13:14:34 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 01/12] Makefile: Only build virtiofsd if system-mode
 is enabled
Message-ID: <20200518121434.GA2787@work-vm>
References: <20200504152922.21365-1-philmd@redhat.com>
 <20200504152922.21365-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200504152922.21365-2-philmd@redhat.com>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 23:32:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_HK_NAME_DR=0.01, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 18 May 2020 12:15:01 -0000

* Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> Do not build the virtiofsd helper when configured with
> --disable-system.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Yeh that seems reasonable; although virtiofsd is self-contained enough
that perhaps it should be unrelated to whether you're building that.



Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 34275f57c9..e46b6ef5d4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -345,7 +345,7 @@ HELPERS-y += vhost-user-gpu$(EXESUF)
>  vhost-user-json-y += contrib/vhost-user-gpu/50-qemu-gpu.json
>  endif
>  
> -ifeq ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG),yyy)
> +ifeq ($(CONFIG_SOFTMMU)$(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG),yyyy)
>  HELPERS-y += virtiofsd$(EXESUF)
>  vhost-user-json-y += tools/virtiofsd/50-qemu-virtiofsd.json
>  endif
> -- 
> 2.21.3
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


