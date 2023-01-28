Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pLiRt-0005FS-5B
	for mharc-qemu-riscv@gnu.org; Sat, 28 Jan 2023 05:28:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLiRp-0005Er-Eq
 for qemu-riscv@nongnu.org; Sat, 28 Jan 2023 05:28:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pLiRn-0004AC-HW
 for qemu-riscv@nongnu.org; Sat, 28 Jan 2023 05:28:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674901714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=onqBJLAeKWJ00rmW8PmLFuUlG7BY36S6l8hn+KpBJ40=;
 b=ArVzU5VH3oZcSYXQhkplr/SN86R4bnCkjNvXH6FI9TJVSV5MIrY/7Q1/n/x/helCr8Wd8m
 pm1l7ramWPK6IdqdHESQw5JpjPo3x1qROW4ZFoxaV8spRmkZBYfB7un36R0CkRyhoA1ra6
 gXa1OMBoQJV0LgkXstwTDH4AY8EVo2Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-125-n0iV9FFHPx-tkPQujyK4xg-1; Sat, 28 Jan 2023 05:28:33 -0500
X-MC-Unique: n0iV9FFHPx-tkPQujyK4xg-1
Received: by mail-wm1-f71.google.com with SMTP id
 l8-20020a05600c1d0800b003dc25f6bb5dso4207180wms.0
 for <qemu-riscv@nongnu.org>; Sat, 28 Jan 2023 02:28:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=onqBJLAeKWJ00rmW8PmLFuUlG7BY36S6l8hn+KpBJ40=;
 b=NFyUPxQmNECsUHjT33F4HRcDJH6wWxti2sbCyfXzrRWi5XPqR9+ZygD0CN1HpfB+74
 P5lDkFJ830LjQlktgZwdeA4zKWUmipHmVMA025NRsMgsPwAJ4tL9MrnF3M8SH2dK6TBM
 8JgBqX8oLE/7Jq6c5F1yaBsExytiSJDpUmNmAhylmjnDJLDgFNzH1rVPbrM/eZ/LtrrB
 nWE2xPWHvQHnaod6AKnagtqt1SVprbtXUR2pqc34zB2HlgH2f54DMZMQ+A6prAFKum5x
 wmlnLaU3229jUGEYmdjVTkYMZ3oxcPJYvkD5bpP2TSYTZ8W4QJaYWV5oRQPZrrrli5pe
 uWPw==
X-Gm-Message-State: AFqh2kqqt0TZpZkUHqygGfzWQ9FN7z24ZPuU9UDWso+Q0DM38+dXT6hU
 IuTMjvd99jTL7OcLbtOL/BQXMW/kmsemoTGTAQF3mzfki5EJFEEt3TWCTI05CqMnwxftSESqeYY
 H8hBf7wWXrK+0Wbs=
X-Received: by 2002:a05:600c:4fd3:b0:3cf:7197:e68a with SMTP id
 o19-20020a05600c4fd300b003cf7197e68amr40912372wmq.18.1674901711961; 
 Sat, 28 Jan 2023 02:28:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt3lUkHn8aJG6qvJP8kZYFw9zdQXqkr1X9X+WoFGy4L56cs6qzCQ1Ax+cxM/ct9NBtuqpx90w==
X-Received: by 2002:a05:600c:4fd3:b0:3cf:7197:e68a with SMTP id
 o19-20020a05600c4fd300b003cf7197e68amr40912341wmq.18.1674901711722; 
 Sat, 28 Jan 2023 02:28:31 -0800 (PST)
Received: from redhat.com ([2.52.20.248]) by smtp.gmail.com with ESMTPSA id
 z24-20020a1cf418000000b003dc36981727sm4465426wma.14.2023.01.28.02.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 02:28:31 -0800 (PST)
Date: Sat, 28 Jan 2023 05:28:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, philmd@linaro.org,
 peter.maydell@linaro.org, alistair@alistair23.me,
 jasowang@redhat.com, jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de, quintela@redhat.com,
 dgilbert@redhat.com, michael.roth@amd.com, kkostiuk@redhat.com,
 tsimpson@quicinc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 01/19] scripts/clean-includes: Fully skip / ignore files
Message-ID: <20230128052749-mutt-send-email-mst@kernel.org>
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-2-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230119065959.3104012-2-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 28 Jan 2023 10:28:37 -0000

On Thu, Jan 19, 2023 at 07:59:41AM +0100, Markus Armbruster wrote:
> When clean-includes claims to skip or ignore a file, only the part
> that sanitizes use of qemu/osdep.h skips the file.  The part that
> looks for duplicate #include does not, and neither does committing to
> Git.
> 
> The latter can get unrelated stuff included in the commit, but only if
> you run clean-includes in a dirty tree, which is unwise.  Messed up
> when we added skipping in commit fd3e39a40c "scripts/clean-includes:
> Enhance to handle header files".
> 
> The former can cause bogus reports for --check-dup-head.  Added in
> commit d66253e46a "scripts/clean-includes: added duplicate #include
> check", duplicating the prior mistake.
> 
> Fix the script to fully skip files.
> 
> Fixes: fd3e39a40ca2ee26b09a5de3149af8b056b85233
> Fixes: d66253e46ae2b9c36a9dd90b2b74c0dfa5804b22

Isn't
Fixes: %h (\"%s\")

the accepted format for this?

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
>  
>    if [ "$MODE" = "c" ]; then
>      # First, use Coccinelle to add qemu/osdep.h before the first existing include
> @@ -174,8 +176,8 @@ for f in "$@"; do
>  
>  done
>  
> -if [ "$DUPHEAD" = "yes" ]; then
> -    egrep "^[[:space:]]*#[[:space:]]*include" "$@" | tr -d '[:blank:]' \
> +if [ "$DUPHEAD" = "yes" ] && [ -n "$files" ]; then
> +    egrep "^[[:space:]]*#[[:space:]]*include" $files | tr -d '[:blank:]' \
>          | sort | uniq -c | awk '{if ($1 > 1) print $0}'
>      if [ $? -eq 0 ]; then
>          echo "Found duplicate header file includes. Please check the above files manually."
> @@ -184,7 +186,7 @@ if [ "$DUPHEAD" = "yes" ]; then
>  fi
>  
>  if [ "$GIT" = "yes" ]; then
> -    git add -- "$@"
> +    git add -- $files
>      git commit --signoff -F - <<EOF
>  $GITSUBJ: Clean up includes
>  
> -- 
> 2.39.0


