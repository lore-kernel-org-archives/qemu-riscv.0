Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pLWI5-00088d-Vq
	for mharc-qemu-riscv@gnu.org; Fri, 27 Jan 2023 16:29:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pLWI4-00088T-Uu
 for qemu-riscv@nongnu.org; Fri, 27 Jan 2023 16:29:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pLWI3-0000g1-Gz
 for qemu-riscv@nongnu.org; Fri, 27 Jan 2023 16:29:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674854982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5604c2amRssKNuQ/KnZQ1hU9ntO9ROE8Vsb8YVLLtMs=;
 b=eOdFK5Op5S/ZDpSvZ4PY+haNcVisMNQGpw/1EZPOy4+f4bFlCpxZP2WQWp0Z5REwTTOMtr
 sdQW5WZdYUo8nKRwpmryGvvZuu2grYRlARLdibG1TnPsyd1NIrKFvL85x6lw+0RVy+F3x0
 UkFrl64kwnclJhrjJY/uQVkCzJheNZw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-jClL65yzO6q0dGkB3TSMVQ-1; Fri, 27 Jan 2023 16:29:39 -0500
X-MC-Unique: jClL65yzO6q0dGkB3TSMVQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA5D3811E6E;
 Fri, 27 Jan 2023 21:29:38 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B90E14171BE;
 Fri, 27 Jan 2023 21:29:35 +0000 (UTC)
Date: Fri, 27 Jan 2023 15:29:33 -0600
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com,
 philmd@linaro.org, peter.maydell@linaro.org, alistair@alistair23.me,
 jasowang@redhat.com, jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de, quintela@redhat.com,
 dgilbert@redhat.com, michael.roth@amd.com, kkostiuk@redhat.com,
 tsimpson@quicinc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 01/19] scripts/clean-includes: Fully skip / ignore files
Message-ID: <20230127212933.5bcwjqn6ht6fd7uq@redhat.com>
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-2-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119065959.3104012-2-armbru@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 27 Jan 2023 21:29:45 -0000

On Thu, Jan 19, 2023 at 07:59:41AM +0100, Markus Armbruster wrote:
...
> 
> Fix the script to fully skip files.
> 
> Fixes: fd3e39a40ca2ee26b09a5de3149af8b056b85233
> Fixes: d66253e46ae2b9c36a9dd90b2b74c0dfa5804b22
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  scripts/clean-includes | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/clean-includes b/scripts/clean-includes
> index d37bd4f692..86944f27fc 100755
> --- a/scripts/clean-includes
> +++ b/scripts/clean-includes
> @@ -111,6 +111,7 @@ cat >"$COCCIFILE" <<EOT
>  )
>  EOT
>  
> +files=
>  for f in "$@"; do
>    case "$f" in
>      *.c.inc)
> @@ -144,6 +145,7 @@ for f in "$@"; do
>        continue
>        ;;
>    esac
> +  files="$files $f"

Bash's += might perform faster here, but this is a #!/bin/sh script.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


