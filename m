Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F66EC77B7C
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 May 2023 07:59:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pxNgG-0003WY-V8; Fri, 12 May 2023 03:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yin.wang@intel.com>)
 id 1pxNg8-0003Uu-ME; Fri, 12 May 2023 03:59:09 -0400
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yin.wang@intel.com>)
 id 1pxNg7-0002LP-2a; Fri, 12 May 2023 03:59:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683878343; x=1715414343;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=nJuvh7Qa3CS/e3S2NNsUw4Ulrp/hWTRMWTr6WPlCbU0=;
 b=hNADCJwbl0qdUh6IdXyU+VAUTaZbkeQRWSU2S9HFkD7feA8z4hku+h+D
 fQd+3rmW8LOjQphlL32sg6dh7wXidztjRSe9UOzxfjl4nbtUoBOTsBxia
 yURndWhy2ioInFFQp1YqAdpCTqGH/LAL2+F/Z9A2ubj8KiBQlykIgqkof
 6yl5BSPLhAazft3p7G1HLqYYjnPpiMBQ9BxyQwJtnHRRFDY/MMR9B4Igm
 RAiPPFrOFrzckaUPOSEmd707mKjb8KB0+5JgsMXnNSyRm3ktGaEBOK+9Y
 86yR4Cgw9AjqWzpLGPx/Y5njE99XGwqE7b9gNTvGtolIQG16Mx7spXwcJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="437065014"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="437065014"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 00:58:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="874308541"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="874308541"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 12 May 2023 00:58:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 00:58:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 12 May 2023 00:58:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 12 May 2023 00:58:59 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 12 May 2023 00:58:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYv0FPQ8m246cZv2QFskmg7ZGITjNxYFhn8w4JnPLTORBPO8sqjHGkWa3/FAS+V1cHlGPiqtMoiczBCwgBbIRXrAqb9GEYbst13j7LaQwFKIkAXuSiCHdPw25PKA8FaHBRJniW3Zvknq/sFyEudG/g2VTkqbE1zxjyh2+9iGgJHvShEKYmpA9EFNQtO397no8ndhOWRxETQtZL1ygetjoD/h9alCtZO0Rfu1wn7RreSTiY7eOuKWwnMdTuyxv/b84z6cWp/8k/072G2kUBYax0dvfY8nEUizRGqtlh3huOCio143Nv5mrCJd0NLUhTN4qt6Wl+HU+cHLlTJbhAhUTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJuvh7Qa3CS/e3S2NNsUw4Ulrp/hWTRMWTr6WPlCbU0=;
 b=Z+JJfzf1xp8yogmzCFbdKAKZlc6yjIb51aIqtxsMuMuONM0//eO6MS7D27OevDsZl4n9q9xtFl5W2SJ47XD0dtiXyPL9JOngUXNpAP5ULapcihn4OVDLthCUaWKcT7WXGOjpJ6bvt7CBAn1V7wsi+axvsSxDyTYxSxDb+7f0jztBsyKpmClsCKjooLqS7j6bA9A0LdYf+4C/3Wkt6E97phYVpPKEAD1nEwvCQhvlBv1I1g5Z7JZ/mKhK/2p+ZV6hSxbug/tTcgiWJWAEFc/jkVBJNGnvUTeQ3nLoNCmDdhyYu8Z46FQi+QSPLdRu8fi/TngTBMyre8XyQPfXVCD2FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2670.namprd11.prod.outlook.com (2603:10b6:805:61::25)
 by SJ0PR11MB5151.namprd11.prod.outlook.com (2603:10b6:a03:2ac::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.23; Fri, 12 May
 2023 07:58:13 +0000
Received: from SN6PR11MB2670.namprd11.prod.outlook.com
 ([fe80::1675:645a:6f0e:d393]) by SN6PR11MB2670.namprd11.prod.outlook.com
 ([fe80::1675:645a:6f0e:d393%4]) with mapi id 15.20.6363.032; Fri, 12 May 2023
 07:58:13 +0000
From: "Wang, Yin" <yin.wang@intel.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "Wang, Yin" <yin.wang@intel.com>, LIU Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liweiwei@iscas.ac.cn>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 "Meng, Bin" <bin.meng@windriver.com>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>, "open list:RISC-V TCG CPUs"
 <qemu-riscv@nongnu.org>
Subject: Recall: [PATCH v3] hw/riscv: qemu crash when NUMA nodes exceed
 available CPUs
Thread-Topic: [PATCH v3] hw/riscv: qemu crash when NUMA nodes exceed available
 CPUs
Thread-Index: AQHZhKeA1bFxf55E7kSAEBpAGOFc5A==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 35
X-FaxNumberOfPages: 0
Date: Fri, 12 May 2023 07:58:12 +0000
Message-ID: <SN6PR11MB2670E03881E48F27E4F9803C80759@SN6PR11MB2670.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2670:EE_|SJ0PR11MB5151:EE_
x-ms-office365-filtering-correlation-id: 32746e97-3ec0-4b8a-a36c-08db52bea2a7
x-ms-exchange-recallreportgenerated: true
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WsLoaNEi1tzTOxEsUaesQvKARe4XvsD6PzzBRd1HY4+UaE8M3F7XV2Ey6OvSAEFpXHiG+ZYJGsLVvzcZFQKEJcfkfI6HFDmF4VG/4wJOFiCnrRhTXxoDvJMzttBb8gpJsQaDhOglaeQnuw3wGE21Zw9481/2l4adN98D/yW9wpKN5uqFr5drzrlrQY+SJBiWU7wMusaSDMDWBj0Fhq2ZvgU6/3McMU0NY1wrPuDgP8QTbYfJV9YD3Tv6eY86Np8OKipeg5tmvgXzGUre+/8Zr/5mRBgaeb50/jl99TRR7YpwLfqqjXD3MR4CKsh5xVZIs0NTKxi+qw5uMAMwS0egPPWZQjqNl9vMVTowi1L+gf8BLzVID2MuWYBeP5JpmiuU0iW94O5r29MeNJwk2tk39+rC62K17hELtiosm3LFppZaCIEsKdikjNXXIzpxByIGrS/wRGu2L/0IsCLEOhE6/pGHBXj4aZuAfMHlAiZojNhXFSPStdP7fUP34VlLtVYeYIgIxKetESD9u7FDmWe/h4PABzrgfvbX1LzROUcaQa/YX09ThifBwK4DJj7oTd762N+MS93C1tBpL2aHOWuV+EzLreFYmLW+HucUOem6nLpXqd+NJ2hgYiGv5onaMSqJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2670.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(376002)(396003)(39860400002)(136003)(451199021)(122000001)(82960400001)(38100700002)(55016003)(33656002)(558084003)(38070700005)(86362001)(52536014)(5660300002)(8936002)(8676002)(9686003)(26005)(6506007)(186003)(2906002)(76116006)(66556008)(66476007)(64756008)(66946007)(66446008)(54906003)(478600001)(6916009)(71200400001)(4326008)(316002)(41300700001)(7696005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/yqPq51u3QDMi05Kioc/d10bFMWbq+vmDaHeo38Hp36ffbfVUXzVjnoUmMlu?=
 =?us-ascii?Q?sY6p9EKgsYAUAxnu6qaG2CAU0Q76F3Yhr04UT7YfuF6USKkyGsY+Zyee/bgp?=
 =?us-ascii?Q?Ow3M10xWSq9RL4U4rRsm90pnwvm5c7Y7dms9arIGdZS4HWk89Ak5OrkZ4Noz?=
 =?us-ascii?Q?ljMWg93ICsLSi/mq35wnk0sQUsNm+s+D+4WIliomsIGdr9gUMCO51Drv740K?=
 =?us-ascii?Q?Kv6dcJl5tNCiGpjO/hMQ8eJLe/uWcQBp3bIUu063+BX+DPWWXzIBuXy9W8B+?=
 =?us-ascii?Q?e7rwKbfWrbk0lKCKYY/jDT9448k4r5BbZtcpp8IUgvzs5Ovtbp0e8obYyTeQ?=
 =?us-ascii?Q?YRvIDvkdKUBzGAmAGGLxPjtxuu0vH25BeX9dI6/muHUf+VfSFcqk2e6I/bQS?=
 =?us-ascii?Q?6vPOCiieUvYT+HB7jh3HPrlrfWpc8+uiYgHBkG1Rz6XI6mJxJ3MZGWH/OROq?=
 =?us-ascii?Q?Kd+15B6ChhbfeuIIOHcvcbg307T1xy//5O2CWiW9mL1vaAnthM0VMrEjm7+4?=
 =?us-ascii?Q?3ASILyicORjpBfrN34G/2mrE3iM6bi+34xezQcRp7K9SpEodhikdgJao9tQx?=
 =?us-ascii?Q?PGhPyUh5EcrBSz3HxjkZm9eRiX/IE9L7Lhgb3E9RTLB++pJOuNVAVKuEa7bS?=
 =?us-ascii?Q?5mRJUOHie9YHfDJy4c9ZiSgI54sAVHkulrkmiYSG8UPmJRHja7wuhgDBXp/v?=
 =?us-ascii?Q?ci4+7xSUqqMAkRvdFcFZMCFZRv7OM1puEcd0KDgsJ2U37mb6BlXlbsXsWhBr?=
 =?us-ascii?Q?vIQ6xNzlzKWgBKUi2YejByaV6d6aGFcj97vcKlwz0r+wx/oEU6TpyujHluqE?=
 =?us-ascii?Q?lRtplampckUBItg978vAQIxvLQfrIxo2LCRsr7enMRVL8WSOLCfEkoy349yA?=
 =?us-ascii?Q?aR4W6t5XHbkNvs4R95s81J/ckeUi5fdSMcouXbow4gkIy/m0F2O49U+XL+9o?=
 =?us-ascii?Q?pjTfH57YLA692shRfg8QoCpht9km0zftpP84Yop6hySdVEsacQhVaCOZOhce?=
 =?us-ascii?Q?8FHJDxfDKvIPUgIE7RGsLO02swJeJWmSo6gGt4B5PoKBGE1og/QjpIzD7LvV?=
 =?us-ascii?Q?G+IkVtxGByQ4Ow+bfW48tA20d4W4MgO2kGTO+V1v9KhuyudfDl3CNiPa+SIP?=
 =?us-ascii?Q?rnlA5d6kgTuj/TR4pkHFRBZw++YrhtnWX3qkw9fxNXK74k1+GR9Mvq9/zfo/?=
 =?us-ascii?Q?cKRRXESrdMxaA4ZR1bcuFM3v/ipIz/+ssGPrY0lu/fAazYWqX5bQ18dAhw9L?=
 =?us-ascii?Q?8pfIVVhOlLvFM3dLr4Px6IUUKZFbRAaya6AFV2OvaTHx3gMdn5J9qmQiM6Bf?=
 =?us-ascii?Q?9+uMS61FU+/lJgSYXoy+vZXgllrPD0NhXMxo8Sswo7P/KLcjNOfCClz1KyDk?=
 =?us-ascii?Q?c5icGfd4NN41bS6ML2wYGFarW1e2k0afl64cFSmeg2y3d7705wRBMoOINKok?=
 =?us-ascii?Q?N9dqxj9GvN7HKwEp+RyHBP4/CaHvwnyLwpyKfuekXaYjqcTnDLGZusGFO3oZ?=
 =?us-ascii?Q?2d2h69oCkbY3IBaiChqJely3i07CyyphqBoNnrxvN+uDTDuZnk57SYrPcBsK?=
 =?us-ascii?Q?vlhCsAV1XUCDR81PnhU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2670.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32746e97-3ec0-4b8a-a36c-08db52bea2a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2023 07:58:12.8649 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZQBMzHLDaGYeXwMIRUchTljx+1CMxVKO9GLM+un9o5zAOdHIig1+/KFKcblBrAl/e3pz6cfpLKZauOVze0dTfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5151
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.43; envelope-from=yin.wang@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Wang, Yin would like to recall the message, "[PATCH v3] hw/riscv: qemu cras=
h when NUMA nodes exceed available CPUs".=

