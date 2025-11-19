Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7237DCF58C6
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 18:09:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vLmcZ-00036G-EB; Wed, 19 Nov 2025 13:09:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vLmcW-00034F-Q2
 for qemu-riscv@nongnu.org; Wed, 19 Nov 2025 13:09:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vLmcU-0002te-F7
 for qemu-riscv@nongnu.org; Wed, 19 Nov 2025 13:09:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763575769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0DCGaHtOp5reLxorwEtMOeyn9iP1bnDso8ubGDPMiBA=;
 b=gJ44lrST8kZ6Pb/8sVf1QZIDJnoLF5LovT3lEkXAB5GENhWXS1E4pyqwVa0rLy+J/UDuYo
 4vOJSAXbT4mZtei9/ykeuRa15Jq9zluLjjrK5u/AXAXOVzUjdMskHQgwn4IsDtGltyaQj1
 cO08hCy58gB7tH+QZOwI5+IWrymFy+s=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-bNx9sCW9MHWxMIs427CwfA-1; Wed, 19 Nov 2025 13:09:28 -0500
X-MC-Unique: bNx9sCW9MHWxMIs427CwfA-1
X-Mimecast-MFC-AGG-ID: bNx9sCW9MHWxMIs427CwfA_1763575768
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8826fb20ef0so1065926d6.0
 for <qemu-riscv@nongnu.org>; Wed, 19 Nov 2025 10:09:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763575768; x=1764180568;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0DCGaHtOp5reLxorwEtMOeyn9iP1bnDso8ubGDPMiBA=;
 b=OVZ4biXNxBZ2nJb+pk82h7ZVxE99W4ti+lT70KK17C0Woe1OKyLY3kcUdnQfboZgoJ
 xVyOh/YMMevJvpfI3O9d+MzLo92KyGmylqdBOqbzQTmCqwmje+CVYqulRr2+nMG+Ymjy
 UNTLjqFA4jcIugNBFHttp4eARqlZ+txASCw7DKeE+HsQP8wOw+GS9vl/tWWOlvtCnUUK
 guI2ha17/pbOrmNGD5LrmHDmYnMELsiwQZ6BskRYmfOOn6dt6NCkhS4rxOjMNTOiPDuI
 TQUfqthx1K5WrselSJbJgGH2aW/aYd9EJWgKE2P/2OAoLSik2pVdW7qiZtIpaBaKOH1e
 PLFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgCmVxZ63DYLWVFGHEk+Zq+wCZ71tGENtUURktWe/vCUGPsiKZgu1DiM49j0le7QnLnTPn71KeVBig@nongnu.org
X-Gm-Message-State: AOJu0YzbqV7Uq50OnjA8O0a2qnzVe9OL2QBKpTVyDVFpUpK1TW8V3dgX
 qArYDORMkazCvmaGZ4zsSj6vhbXzq3ZBP4D/1V6skqcw5CO3zfM7acvi6Em1E6t35JIcN29XCu2
 R4LAyeUMWgR9S2KFqGiil5aKjM6ESgwIvWBvGq5FUe5CDV206FqUp8TOB
X-Gm-Gg: ASbGncvWqPmrRnCO8nUNvfaPUwNmKy9qe2DCVzLAJ8hMPSAHS7JuiR8qpsPSrNp5B5K
 XftuYyQrxjmB1/6FNCINQ0SCjwgTXHdqvu7XV83EiCGvJ5SJv503ManDkO3ZNXdk+Ti5bRJY5T0
 zPvcPelaC3FQ1Jl8gdj4bIqjUspTgMsQCoSvBVvK6KvX4wDQnrJgnhANUvi/kCLIj2oYr3q0bjG
 lprW7hadui/uBcDsjnpYSZSbkH8gUuqrB94/LaRcnxp7XeHJwUuCwOoKShsm0P1N3+uZVGlzDPm
 wdgE6YWzWtI268M39vHyk0A4+AOYdQp2ukzSZRgI5S4RI9xyOn+q9cFX+ruxtkX/I1hwUrJsoCV
 oX7A=
X-Received: by 2002:a05:6214:3a85:b0:880:5730:d3db with SMTP id
 6a1803df08f44-8846e054d65mr2568516d6.21.1763575767598; 
 Wed, 19 Nov 2025 10:09:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhcLsZHPo01FYGgTUQih5BLapAokqbeuAA+4Y54wTxOgNgHkwNxLSBBg1nI3YTS9Sdt0XpFw==
X-Received: by 2002:a05:6214:3a85:b0:880:5730:d3db with SMTP id
 6a1803df08f44-8846e054d65mr2567856d6.21.1763575767173; 
 Wed, 19 Nov 2025 10:09:27 -0800 (PST)
Received: from x1.local ([142.188.210.156]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8846e445b1csm262086d6.9.2025.11.19.10.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 10:09:26 -0800 (PST)
Date: Wed, 19 Nov 2025 13:09:24 -0500
From: Peter Xu <peterx@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 alistair@alistair23.me, edgar.iglesias@gmail.com, npiggin@gmail.com,
 harshpb@linux.ibm.com, palmer@dabbelt.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 berrange@redhat.com, farosas@suse.de, eblake@redhat.com,
 vsementsov@yandex-team.ru, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, zhao1.liu@intel.com, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/5] hw/nvram/xlnx-bbram: More idiomatic and simpler
 error reporting
Message-ID: <aR4H1FyafbvOUw2c@x1.local>
References: <20251119130855.105479-1-armbru@redhat.com>
 <20251119130855.105479-3-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20251119130855.105479-3-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SOLqqxCOdi769L5cLKekJJBW0COKpPZrr2Ny4z4C7fo_1763575768
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Nov 19, 2025 at 02:08:52PM +0100, Markus Armbruster wrote:
> bbram_bdrv_error() interpolates a "detail" string into a template with
> error_setg_errno(), then reports the result with error_report().
> Produces error messages with an unwanted '.':
> 
>     BLK-NAME: BBRAM backstore DETAIL failed.: STERROR
> 
> Replace both calls of bbram_bdrv_error() by straightforward
> error_report(), and drop the function.  This is less code, easier to
> read, and the error message is more greppable.
> 
> Also delete the unwanted '.'.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


