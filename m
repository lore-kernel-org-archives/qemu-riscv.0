Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7672CF58C6
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 18:07:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vLmZj-0001cV-FY; Wed, 19 Nov 2025 13:06:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vLmZh-0001az-UV
 for qemu-riscv@nongnu.org; Wed, 19 Nov 2025 13:06:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1vLmZg-0002kb-Ne
 for qemu-riscv@nongnu.org; Wed, 19 Nov 2025 13:06:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763575596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zxKk+ZBrfy+3vEGqZdJgfoqPz6L6wSNR8CNOxVRPE4c=;
 b=VlMsuoi1p6TTwBjL+hh5RMlHl10hjws/DsevogC9RL29qNOj8Zeo8v86n5vGduoYgzSfup
 5jkmgfkL3zseIRrkxloqfhqs9grilag+Aw834J59RUdtgXbB1ln7LnC27szOiftTqXTuRa
 4teI5N/Tk0hPqPonCUmbp9Pvx0yKUog=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-E6bvpdnuMzebxXICd9F2hw-1; Wed, 19 Nov 2025 13:06:32 -0500
X-MC-Unique: E6bvpdnuMzebxXICd9F2hw-1
X-Mimecast-MFC-AGG-ID: E6bvpdnuMzebxXICd9F2hw_1763575592
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88236279bd9so309366d6.3
 for <qemu-riscv@nongnu.org>; Wed, 19 Nov 2025 10:06:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763575592; x=1764180392;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zxKk+ZBrfy+3vEGqZdJgfoqPz6L6wSNR8CNOxVRPE4c=;
 b=b/mopx9SAnqanGnhPtKqbvgrL+WFeO05OOCYtL6aPz6DrdN0lVfqmnGduwuQZHYu3z
 45BrLjmUU2YOtBuLZMpFJQsSXX8iw6DxWvrS5TSO+/fCwRWaY8rpK7CmVQ4XKAEIEXlk
 Z4n34+iCsN543DWBF0DpDFvrOm4/ci0+gghyHYqJtasETV4y+8k9Tip8y6gA+FuXdKvq
 xVu94GZjoTvMoBrv+8/m/wNMCtelN0YOkUNG7oEo1Wh2mx9TsPY6gJACGGXjYGlzI/hI
 D+hgbw8ohFjddW3TqZpqlO5ox6HAYXCsreZaoI2bZCCV6VvwmKuDH1puMccv30tAI2Ik
 BATg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhpFEJ+aDqPnaUWvj7BHErLPeG8fvuhpRan3Mhd0vOame3RJPy9UdaVPj0pzhUc3f+G8C4t35jjTuI@nongnu.org
X-Gm-Message-State: AOJu0Yy5SFJQVcCrTipdWMJoYWQB2GHdqiNyTpygL6GE96Mgjaioo2vS
 IIB3gzyXWbSCaAhy0z0redkgLUupWX2/vqUQBsUS02mEnvjNAgXxlqHEnQGA36wrZQAuCUDvaat
 gpN8bJEXJdHUQYUxyXWRJzsywFg0H9eGYSuuNQyVH7GGtaIRGFX0ofYOb
X-Gm-Gg: ASbGncs8Yvkf2x1MBzpqJZ5zmZgSFEIsnZvmMRca1zasKoDI49q8HkK/dc0SJjiNKAK
 AjcNlR9NUjbmfudck8BmwdS7m9u67o8mAtUoq7L0XFbGhgNTf5+t8A3XsGZjHseh6McgoRuliVL
 qr5nZ0bhRrE9Q6ALhKeKdYuPEpnDXTw4ouXYX8+LM8Cx54kB7YDM9Wwbc7RFf76FHIEE5dDJMyC
 nOa1QopKDjbPmih/fkQhsyl6iMzkv/XgIC1KB70uiRW0FvWkY5Kb4uFRmyOOS1WHxLT0HRmu1GG
 zkxhYG1xPFDUDC+/4/ok+r5e/8iDvwML+a9fGzeWpY+JlrnlrZoMPZcXs6YZF59sYz/NHGaAT6h
 9s80=
X-Received: by 2002:a05:6214:20ad:b0:880:48c6:acfb with SMTP id
 6a1803df08f44-8846e1d1ee1mr1615876d6.49.1763575592035; 
 Wed, 19 Nov 2025 10:06:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFA3KddVigP0uQkMDW+wiQ07QNB1nQ4u8CPelnAOsxIbSfbRmY+sPznvOSd7uBlcPTF+2F45w==
X-Received: by 2002:a05:6214:20ad:b0:880:48c6:acfb with SMTP id
 6a1803df08f44-8846e1d1ee1mr1615226d6.49.1763575591593; 
 Wed, 19 Nov 2025 10:06:31 -0800 (PST)
Received: from x1.local ([142.188.210.156]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8846e46a846sm181466d6.18.2025.11.19.10.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 10:06:31 -0800 (PST)
Date: Wed, 19 Nov 2025 13:06:29 -0500
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
Subject: Re: [PATCH 1/5] hw/core/loader: Make load_elf_hdr() return bool,
 simplify caller
Message-ID: <aR4HJQGqCswwH022@x1.local>
References: <20251119130855.105479-1-armbru@redhat.com>
 <20251119130855.105479-2-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20251119130855.105479-2-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3dFILMn6BjXSUyFVHmuZfVDd_Ybe1WhUNfGASudCy0k_1763575592
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Wed, Nov 19, 2025 at 02:08:51PM +0100, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


