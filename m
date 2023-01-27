Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pLWQp-00031S-93
	for mharc-qemu-riscv@gnu.org; Fri, 27 Jan 2023 16:38:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pLWQn-00030g-Uj
 for qemu-riscv@nongnu.org; Fri, 27 Jan 2023 16:38:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pLWQk-0002qQ-Rr
 for qemu-riscv@nongnu.org; Fri, 27 Jan 2023 16:38:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674855521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ya3zFGla2F6Utbg1telArH2Elj2nIZTjDf4ias2Q7yw=;
 b=RFffHq9PzZgAq3QSV6cmDLECgaCPR6uCsaXg4SkHq+uuIPpWotDVcC92CO8IosxInDdoko
 LqSfHf1Ac6vouV6/YHsL0r1U1XVmkoDFyMRiqFmAaPKlw4dClx34EuI6lhKH1l/+7oGNr7
 mHIwFUGU5z9FQCu6K/kme6kNpZOocYg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-TfwT3yR3MuiFniYt48dwAA-1; Fri, 27 Jan 2023 16:38:38 -0500
X-MC-Unique: TfwT3yR3MuiFniYt48dwAA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 040C8101A55E;
 Fri, 27 Jan 2023 21:38:37 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 214397AD4;
 Fri, 27 Jan 2023 21:38:34 +0000 (UTC)
Date: Fri, 27 Jan 2023 15:38:32 -0600
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
Subject: Re: [PATCH v4 02/19] scripts/clean-includes: Don't claim duplicate
 headers found when not
Message-ID: <20230127213832.qzjhacznhvpochpn@redhat.com>
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-3-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119065959.3104012-3-armbru@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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
X-List-Received-Date: Fri, 27 Jan 2023 21:38:46 -0000

On Thu, Jan 19, 2023 at 07:59:42AM +0100, Markus Armbruster wrote:
> When running with --check-dup-head, the script always claims it "Found
> duplicate header file includes."  Fix to do it only when it actually
> found some.
> 
> Fixes: d66253e46ae2b9c36a9dd90b2b74c0dfa5804b22
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  scripts/clean-includes | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/clean-includes b/scripts/clean-includes
> index 86944f27fc..8e8420d785 100755
> --- a/scripts/clean-includes
> +++ b/scripts/clean-includes
> @@ -177,9 +177,8 @@ for f in "$@"; do
>  done
>  
>  if [ "$DUPHEAD" = "yes" ] && [ -n "$files" ]; then
> -    egrep "^[[:space:]]*#[[:space:]]*include" $files | tr -d '[:blank:]' \
> -        | sort | uniq -c | awk '{if ($1 > 1) print $0}'
> -    if [ $? -eq 0 ]; then
> +    if egrep "^[[:space:]]*#[[:space:]]*include" $files | tr -d '[:blank:]' \
> +        | sort | uniq -c | grep -v '^ *1 '; then

Indeed - the awk script was succeeding even if it printed nothing,
whereas the grep -v is a bit lighter-weight and has the intended
semantics of exit status based on output.

Reviewed-by: Eric Blake <eblake@redhat.com>

>          echo "Found duplicate header file includes. Please check the above files manually."
>          exit 1
>      fi
> -- 
> 2.39.0
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


